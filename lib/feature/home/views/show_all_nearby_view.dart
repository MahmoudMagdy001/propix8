import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/responsive_helper.dart';
import '../../../core/di/locator.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/utils/enums.dart';
import '../../../core/widgets/app_sliver_grid.dart';
import '../../../core/widgets/app_sliver_list.dart';
import '../../../core/widgets/app_view_switcher.dart';
import '../../../core/widgets/custom_back_button.dart';
import '../../../core/widgets/unit_grid_card.dart';
import '../../../core/widgets/unit_list_card.dart';
// Correcting import for UnitModel
import '../models/unit_model.dart';
import '../viewmodels/home_state.dart' show HomeRequestStatus;
import '../viewmodels/nearby_units_cubit.dart';
import '../viewmodels/nearby_units_state.dart';

class ShowAllNearbyView extends StatefulWidget {
  const ShowAllNearbyView({super.key});

  @override
  State<ShowAllNearbyView> createState() => _ShowAllNearbyViewState();
}

class _ShowAllNearbyViewState extends State<ShowAllNearbyView> {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<NearbyUnitsCubit>()..loadNearbyUnits(),
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
    if (_isBottom) {
      context.read<NearbyUnitsCubit>().loadMoreUnits();
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
    backgroundColor: context.colorScheme.surface,
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
          NearbyUnitsCubit,
          NearbyUnitsState,
          ({HomeRequestStatus status, List<UnitModel> units, ViewType viewType})
        >(
          selector: (state) => (
            status: state.status,
            units: state.units,
            viewType: state.viewType,
          ),
          builder: (context, data) {
            final status = data.status;
            final units = status == HomeRequestStatus.loading
                ? UnitModel.dummyUnits
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
              child: MultiSliver(
                children: [
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
                            NearbyUnitsCubit,
                            NearbyUnitsState,
                            ViewType
                          >(
                            selector: (state) => state.viewType,
                            builder: (context, viewType) => AppViewSwitcher(
                              viewType: viewType,
                              onToggle: () => context
                                  .read<NearbyUnitsCubit>()
                                  .toggleViewType(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    sliver: viewType == ViewType.grid
                        ? AppSliverGrid<UnitModel>(
                            items: units,
                            itemBuilder: (context, unit) =>
                                UnitGridCard(unit: unit),
                          )
                        : AppSliverList<UnitModel>(
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
        BlocSelector<NearbyUnitsCubit, NearbyUnitsState, bool>(
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
  );

  Widget _buildErrorState() => SliverFillRemaining(
    hasScrollBody: false,
    child: Center(
      child: BlocSelector<NearbyUnitsCubit, NearbyUnitsState, String?>(
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
            color: context.colorScheme.outline,
          ),
          SizedBox(height: 16.h),
          Text(
            context.l10n.noPropertiesFound,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    ),
  );
}

class MultiSliver extends StatelessWidget {
  const MultiSliver({required this.children, super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => SliverMainAxisGroup(slivers: children);
}
