import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_grid.dart';
import 'package:propix8/core/widgets/app_sliver_list.dart';
import 'package:propix8/core/widgets/app_view_switcher.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/core/widgets/unit_grid_card.dart';
import 'package:propix8/core/widgets/unit_list_card.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart'
    show HomeRequestStatus;
import 'package:propix8/feature/home/presentation/bloc/nearby_units_bloc.dart';
import 'package:propix8/feature/home/presentation/bloc/nearby_units_event.dart';
import 'package:propix8/feature/home/presentation/bloc/nearby_units_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShowAllNearbyView extends StatelessWidget {
  const ShowAllNearbyView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<NearbyUnitsBloc>()
      ..add(const NearbyUnitsEvent.unitsRequested()),
    child: const _ShowAllNearbyContent(),
  );
}

class _ShowAllNearbyContent extends StatefulWidget {
  const _ShowAllNearbyContent();

  @override
  State<_ShowAllNearbyContent> createState() => _ShowAllNearbyContentState();
}

class _ShowAllNearbyContentState extends State<_ShowAllNearbyContent> {
  late ScrollController _scrollController;
  bool _showFab = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      if (_scrollController.offset > 200 && !_showFab) {
        setState(() => _showFab = true);
      } else if (_scrollController.offset <= 200 && _showFab) {
        setState(() => _showFab = false);
      }
    }

    if (_isBottom) {
      context.read<NearbyUnitsBloc>().add(
        const NearbyUnitsEvent.moreUnitsRequested(),
      );
    }
  }

  void scrollToTop() {
    if (_scrollController.hasClients) {
      unawaited(_scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colors.surface,
    body: CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          leading: const CustomBackButton(),
          title: Text(context.l10n.nearbyProperties),
          centerTitle: true,
          floating: true,
          snap: true,
        ),
        BlocSelector<
          NearbyUnitsBloc,
          NearbyUnitsState,
          ({
            HomeRequestStatus status,
            List<UnitEntity> units,
            ViewType viewType,
          })
        >(
          selector: (state) => (
            status: state.status,
            units: state.units,
            viewType: state.viewType,
          ),
          builder: (context, data) {
            final status = data.status;
            final units = status == HomeRequestStatus.loading
                ? UnitEntity.dummyUnits
                : data.units;
            final viewType = data.viewType;

            if (status == HomeRequestStatus.failure && data.units.isEmpty) {
              return _buildErrorState();
            }

            if (status == HomeRequestStatus.success && units.isEmpty) {
              return _buildEmptyState();
            }

            return Skeletonizer.sliver(
              enabled: status == HomeRequestStatus.loading,
              child: SliverMainAxisGroup(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlocSelector<
                            NearbyUnitsBloc,
                            NearbyUnitsState,
                            ViewType
                          >(
                            selector: (state) => state.viewType,
                            builder: (context, currentViewType) =>
                                AppViewSwitcher(
                                  viewType: currentViewType,
                                  onToggle: () => context
                                      .read<NearbyUnitsBloc>()
                                      .add(
                                        const NearbyUnitsEvent
                                            .viewTypeToggled(),
                                      ),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    sliver: viewType == ViewType.grid
                        ? AppSliverGrid<UnitEntity>(
                            items: units,
                            itemBuilder: (context, unit) =>
                                UnitGridCard(unit: unit),
                          )
                        : AppSliverList<UnitEntity>(
                            items: units,
                            itemBuilder: (context, unit) => Padding(
                              padding: EdgeInsets.only(
                                bottom: 8.h,
                                left: 4.w,
                                right: 4.w,
                              ),
                              child: UnitListCard(unit: unit),
                            ),
                          ),
                  ),
                ],
              ),
            );
          },
        ),
        BlocSelector<NearbyUnitsBloc, NearbyUnitsState, bool>(
          selector: (state) => state.isLoadingMore,
          builder: (context, isLoadingMore) {
            if (isLoadingMore) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              );
            }
            return const SliverToBoxAdapter(child: SizedBox(height: 20));
          },
        ),
      ],
    ),
    floatingActionButton: _showFab
        ? AnimatedScale(
            scale: _showFab ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: FloatingActionButton(
              mini: true,
              onPressed: scrollToTop,
              backgroundColor: context.colors.primary,
              foregroundColor: context.colors.onPrimary,
              child: const Icon(Icons.keyboard_arrow_up_rounded),
            ),
          )
        : null,
  );

  Widget _buildErrorState() => SliverFillRemaining(
    hasScrollBody: false,
    child: Center(
      child: BlocSelector<NearbyUnitsBloc, NearbyUnitsState, String?>(
        selector: (state) => state.errorMessage,
        builder: (context, errorMessage) =>
            Text(errorMessage ?? context.l10n.error),
      ),
    ),
  );

  Widget _buildEmptyState() => SliverFillRemaining(
    hasScrollBody: false,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 64.w,
            color: context.colors.outline,
          ),
          SizedBox(height: 16.h),
          Text(
            context.l10n.noPropertiesFound,
            style: context.typography.titleMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    ),
  );
}
