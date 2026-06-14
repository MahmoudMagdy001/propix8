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
import 'package:propix8/feature/unit_details/models/unit_details_model.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_cubit.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_state.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_action_buttons.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_amenities.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_compound.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_description.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_developer.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_floor_plan.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_header.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_image_gallery.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_location.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_related_section.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_reviews.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_specs.dart';
import 'package:propix8/feature/unit_details/views/widgets/unit_virtual_tour.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Represents a section tab with its key and label
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
  late final UnitDetailsCubit _cubit;
  TabController? _tabController;
  final ScrollController _scrollController = ScrollController();

  // Section keys for scroll detection
  final _overviewKey = GlobalKey();
  final _detailsKey = GlobalKey(); // Details + Amenities combined
  final _locationKey = GlobalKey();
  final _mediaKey = GlobalKey();
  final _compoundKey = GlobalKey(); // Compound + Developer combined
  final _reviewsKey = GlobalKey();

  bool _isTabBarTapped = false;
  List<_SectionTab> _visibleTabs = [];

  @override
  void initState() {
    super.initState();
    _cubit = locator<UnitDetailsCubit>();
    unawaited(_cubit.loadUnitDetails(widget.unitId));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _tabController?.dispose();
    super.dispose();
  }

  /// Build the list of visible tabs based on unit content
  List<_SectionTab> _buildVisibleTabs(
    BuildContext context,
    UnitDetailsModel? unit,
  ) {
    final tabs = <_SectionTab>[
      _SectionTab(key: _overviewKey, label: context.l10n.tabOverview),
    ]
    // Overview is always visible
    ;

    // Details (Description + Amenities combined)
    if (unit != null &&
        (unit.description.isNotEmpty || unit.amenities.isNotEmpty)) {
      tabs.add(_SectionTab(key: _detailsKey, label: context.l10n.tabDetails));
    }

    // Location
    if (unit != null && unit.latitude.isNotEmpty && unit.longitude.isNotEmpty) {
      tabs.add(_SectionTab(key: _locationKey, label: context.l10n.location));
    }

    // Media (Floor Plan or Video)
    if (unit != null &&
        (unit.media.any((m) => m.type == 'floorplan') ||
            unit.media.any((m) => m.type == 'video'))) {
      tabs.add(_SectionTab(key: _mediaKey, label: context.l10n.tabMedia));
    }

    // Compound + Developer combined
    if (unit != null && (unit.compound != null || unit.developer != null)) {
      tabs.add(_SectionTab(key: _compoundKey, label: context.l10n.tabProject));
    }

    // Reviews is always visible
    tabs.add(_SectionTab(key: _reviewsKey, label: context.l10n.reviews));

    return tabs;
  }

  /// Update TabController if tab count changes
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

    // If scrolled to the bottom, select the last tab
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

      // Section is visible if its top is within viewport threshold
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

    // Reset flag after scroll animation completes
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
    value: _cubit,
    child: Scaffold(
      body: InternetStateManager(
        noInternetScreen: const NoInternetScreen(),
        onRestoreInternetConnection: () =>
            _cubit.loadUnitDetails(widget.unitId),
        child: BlocSelector<UnitDetailsCubit, UnitDetailsState, RequestStatus>(
          selector: (state) => state.status,
          builder: (context, status) {
            if (status == RequestStatus.failure) {
              return BlocSelector<UnitDetailsCubit, UnitDetailsState, String?>(
                selector: (state) => state.errorMessage,
                builder: (context, errorMessage) =>
                    Center(child: Text(errorMessage ?? context.l10n.error)),
              );
            }

            return BlocSelector<
              UnitDetailsCubit,
              UnitDetailsState,
              ({UnitDetailsModel? unit, bool hasRelated})
            >(
              selector: (state) =>
                  (unit: state.unit, hasRelated: state.relatedUnits.isNotEmpty),
              builder: (context, result) {
                final unit = result.unit;
                if (unit == null && status != RequestStatus.loading) {
                  return const SizedBox();
                }

                final isLoading = status == RequestStatus.loading;

                // Build tabs based on available content
                final tabs = _buildVisibleTabs(context, unit);
                _updateTabController(tabs);

                // Show loading skeleton if no tabs yet
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
                              surfaceTintColor: Colors.transparent,
                              leading: const CustomBackButton(),
                              title: Text(context.l10n.unitDetails),
                              actions: [
                                if (unit != null) ...[
                                  IconButton(
                                    icon: const Icon(Icons.compare_arrows),
                                    tooltip: context.l10n.compare,
                                    onPressed: () => context.pushNamed(
                                      AppRoutes.chooseProduct,
                                      pathParameters: {
                                        'baseId': unit.id.toString(),
                                      },
                                    ),
                                  ),
                                ],
                              ],
                              floating: true,
                              pinned: true,
                              bottom: PreferredSize(
                                preferredSize: Size.fromHeight(50.h),
                                child: ColoredBox(
                                  color: context.colorScheme.surface,
                                  child: TabBar(
                                    controller: _tabController,
                                    isScrollable: true,
                                    tabAlignment: TabAlignment.start,
                                    onTap: isLoading ? null : _onTabTapped,
                                    labelColor: context.colorScheme.primary,
                                    unselectedLabelColor:
                                        context.colorScheme.onSurfaceVariant,
                                    indicatorColor: context.colorScheme.primary,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    labelStyle: context.textTheme.labelLarge
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                    unselectedLabelStyle:
                                        context.textTheme.labelLarge,
                                    tabs: _visibleTabs
                                        .map((tab) => Tab(text: tab.label))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
                            // Overview Section
                            SliverToBoxAdapter(
                              child: SizedBox(key: _overviewKey),
                            ),
                            const UnitImageGallery(),
                            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                            const UnitHeader(),
                            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                            const UnitSpecs(),
                            // Details Section (Description + Amenities combined)
                            if (unit != null &&
                                (unit.description.isNotEmpty ||
                                    unit.amenities.isNotEmpty)) ...[
                              SliverToBoxAdapter(
                                child: SizedBox(key: _detailsKey, height: 20.h),
                              ),
                              if (unit.description.isNotEmpty)
                                const UnitDescription(),
                              if (unit.amenities.isNotEmpty) ...[
                                if (unit.description.isNotEmpty)
                                  SliverToBoxAdapter(
                                    child: SizedBox(height: 20.h),
                                  ),
                                const UnitAmenities(),
                              ],
                            ],
                            // Location Section
                            if (unit != null &&
                                unit.latitude.isNotEmpty &&
                                unit.longitude.isNotEmpty) ...[
                              SliverToBoxAdapter(
                                child: SizedBox(key: _locationKey, height: 8.h),
                              ),
                              const UnitLocation(),
                            ],
                            // Media Section (Floor Plan + Virtual Tour)
                            if (unit != null &&
                                (unit.media.any((m) => m.type == 'floorplan') ||
                                    unit.media.any(
                                      (m) => m.type == 'video',
                                    ))) ...[
                              SliverToBoxAdapter(
                                child: SizedBox(key: _mediaKey, height: 20.h),
                              ),
                              if (unit.media.any((m) => m.type == 'floorplan'))
                                const UnitFloorPlan(),
                              if (unit.media.any((m) => m.type == 'video')) ...[
                                SliverToBoxAdapter(
                                  child: SizedBox(height: 20.h),
                                ),
                                const UnitVirtualTour(),
                              ],
                            ],
                            // Compound + Developer Section (combined)
                            if (unit != null &&
                                (unit.compound != null ||
                                    unit.developer != null)) ...[
                              SliverToBoxAdapter(
                                child: SizedBox(
                                  key: _compoundKey,
                                  height: 20.h,
                                ),
                              ),
                              if (unit.compound != null) const UnitCompound(),
                              if (unit.developer != null) ...[
                                if (unit.compound != null)
                                  SliverToBoxAdapter(
                                    child: SizedBox(height: 20.h),
                                  ),
                                const UnitDeveloper(),
                              ],
                            ],
                            // Related Units Section
                            if (result.hasRelated) ...[
                              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                              const UnitRelatedSection(),
                            ],
                            // Reviews Section
                            SliverToBoxAdapter(
                              child: SizedBox(key: _reviewsKey, height: 20.h),
                            ),
                            const UnitReviews(),
                            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: const UnitActionButtons(),
    ),
  );
}
