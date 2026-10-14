import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_event.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_action_buttons.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_amenities.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_compound.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_description.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_developer.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_floor_plan.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_header.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_image_gallery.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_location.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_related_section.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_reviews.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_specs.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/unit_virtual_tour.dart';
import 'package:skeletonizer/skeletonizer.dart';

class _SectionTab {
  const _SectionTab({required this.key, required this.label});
  final GlobalKey key;
  final String label;
}

class UnitDetailsView extends StatefulWidget {
  const UnitDetailsView({required this.unitId, super.key});
  final int unitId;

  @override
  State<UnitDetailsView> createState() => _UnitDetailsViewState();
}

class _UnitDetailsViewState extends State<UnitDetailsView>
    with TickerProviderStateMixin {
  late final UnitDetailsBloc _bloc;
  TabController? _tabController;
  final ScrollController _scrollController = ScrollController();

  final _overviewKey = GlobalKey();
  final _detailsKey = GlobalKey();
  final _locationKey = GlobalKey();
  final _mediaKey = GlobalKey();
  final _compoundKey = GlobalKey();
  final _reviewsKey = GlobalKey();

  bool _isTabBarTapped = false;
  List<_SectionTab> _visibleTabs = [];

  @override
  void initState() {
    super.initState();
    _bloc = locator<UnitDetailsBloc>();
    _bloc.add(UnitDetailsEvent.unitDetailsRequested(widget.unitId));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _tabController?.dispose();
    unawaited(_bloc.close());
    super.dispose();
  }

  List<_SectionTab> _buildVisibleTabs(
    BuildContext context,
    UnitDetailsEntity? unit,
  ) {
    final tabs = <_SectionTab>[
      _SectionTab(key: _overviewKey, label: context.l10n.tabOverview),
    ];

    if (unit != null &&
        (unit.description.isNotEmpty || unit.amenities.isNotEmpty)) {
      tabs.add(_SectionTab(key: _detailsKey, label: context.l10n.tabDetails));
    }

    if (unit != null && unit.latitude.isNotEmpty && unit.longitude.isNotEmpty) {
      tabs.add(_SectionTab(key: _locationKey, label: context.l10n.location));
    }

    if (unit != null &&
        (unit.media.any((m) => m.type == 'floorplan') ||
            unit.media.any((m) => m.type == 'video'))) {
      tabs.add(_SectionTab(key: _mediaKey, label: context.l10n.tabMedia));
    }

    if (unit != null && (unit.compound != null || unit.developer != null)) {
      tabs.add(_SectionTab(key: _compoundKey, label: context.l10n.tabProject));
    }

    tabs.add(_SectionTab(key: _reviewsKey, label: context.l10n.reviews));

    return tabs;
  }

  void _updateTabController(List<_SectionTab> newTabs) {
    if (_visibleTabs.length != newTabs.length) {
      _tabController?.dispose();
      _tabController = TabController(length: newTabs.length, vsync: this);
    }
    _visibleTabs = newTabs;
  }

  void _onScroll() {
    if (_isTabBarTapped || _tabController == null) return;

    final position = _scrollController.position;
    final viewportHeight = position.viewportDimension;
    final threshold = viewportHeight * 0.3;

    if (position.pixels >= position.maxScrollExtent - 50) {
      if (_tabController!.index != _visibleTabs.length - 1) {
        _tabController!.animateTo(_visibleTabs.length - 1);
      }
      return;
    }

    var visibleIndex = 0;

    for (var i = 0; i < _visibleTabs.length; i++) {
      final key = _visibleTabs[i].key;
      final context = key.currentContext;
      if (context == null) continue;

      final box = context.findRenderObject() as RenderBox?;
      if (box == null || !box.attached) continue;

      final pos = box.localToGlobal(Offset.zero);
      final topPosition = pos.dy;

      if (topPosition <= threshold + 100) {
        visibleIndex = i;
      }
    }

    if (_tabController!.index != visibleIndex) {
      _tabController!.animateTo(visibleIndex);
    }
  }

  Future<void> _scrollToSection(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) return;

    _isTabBarTapped = true;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );

    Future.delayed(const Duration(milliseconds: 450), () {
      _isTabBarTapped = false;
    });
  }

  void _onTabTapped(int index) {
    if (index < _visibleTabs.length) {
      unawaited(_scrollToSection(_visibleTabs[index].key));
    }
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: _bloc,
        child: Scaffold(
          body: InternetStateManager(
            noInternetScreen: const NoInternetScreen(),
            onRestoreInternetConnection: () => _bloc.add(
              UnitDetailsEvent.unitDetailsRequested(widget.unitId),
            ),
            child: BlocSelector<UnitDetailsBloc, UnitDetailsState,
                HomeRequestStatus>(
              selector: (state) => state.status,
              builder: (context, status) {
                if (status == HomeRequestStatus.failure) {
                  return BlocSelector<UnitDetailsBloc, UnitDetailsState,
                      String?>(
                    selector: (state) => state.errorMessage,
                    builder: (context, errorMessage) => Center(
                      child: Text(errorMessage ?? context.l10n.error),
                    ),
                  );
                }

                return BlocSelector<
                  UnitDetailsBloc,
                  UnitDetailsState,
                  ({UnitDetailsEntity? unit, bool hasRelated})
                >(
                  selector: (state) => (
                    unit: state.unit,
                    hasRelated: state.relatedUnits.isNotEmpty,
                  ),
                  builder: (context, result) {
                    final unit = result.unit;
                    if (unit == null && status != HomeRequestStatus.loading) {
                      return const SizedBox();
                    }

                    final isLoading = status == HomeRequestStatus.loading;
                    final tabs = _buildVisibleTabs(context, unit);
                    _updateTabController(tabs);

                    if (_tabController == null) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Column(
                      children: [
                        Expanded(
                          child: Skeletonizer(
                            enabled: isLoading,
                            child: CustomScrollView(
                              controller: _scrollController,
                              slivers: [
                                SliverAppBar(
                                  pinned: true,
                                  floating: true,
                                  expandedHeight: 0,
                                  leading: const CustomBackButton(),
                                  title: Text(
                                    unit?.title ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  actions: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.compare_arrows_rounded,
                                      ),
                                      tooltip: context.l10n.compare,
                                      onPressed: () {
                                        unawaited(
                                          context.pushNamed(
                                            AppRoutes.chooseProduct,
                                            extra: {'baseUnitId': widget.unitId},
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                  bottom: PreferredSize(
                                    preferredSize: Size.fromHeight(48.h),
                                    child: ColoredBox(
                                      color:
                                          context.colorScheme.surface,
                                      child: TabBar(
                                        controller: _tabController,
                                        isScrollable: true,
                                        tabAlignment: TabAlignment.start,
                                        onTap: _onTabTapped,
                                        tabs: tabs
                                            .map((tab) => Tab(text: tab.label))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ),
                                const UnitImageGallery(),
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    key: _overviewKey,
                                    height: 12.h,
                                  ),
                                ),
                                const UnitHeader(),
                                const UnitSpecs(),
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    key: _detailsKey,
                                    height: 16.h,
                                  ),
                                ),
                                const UnitDescription(),
                                const UnitAmenities(),
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    key: _locationKey,
                                    height: 16.h,
                                  ),
                                ),
                                const UnitLocation(),
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    key: _mediaKey,
                                    height: 16.h,
                                  ),
                                ),
                                const UnitFloorPlan(),
                                const UnitVirtualTour(),
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    key: _compoundKey,
                                    height: 16.h,
                                  ),
                                ),
                                const UnitCompound(),
                                const UnitDeveloper(),
                                if (result.hasRelated)
                                  const UnitRelatedSection(),
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    key: _reviewsKey,
                                    height: 16.h,
                                  ),
                                ),
                                const UnitReviews(),
                                SliverToBoxAdapter(
                                  child: SizedBox(height: 24.h),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const UnitActionButtons(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      );
}
