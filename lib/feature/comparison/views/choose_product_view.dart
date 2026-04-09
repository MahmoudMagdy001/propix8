import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/di/locator.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/mixins/scroll_pagination_mixin.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/widgets/app_network_error_widget.dart';
import '../../../core/widgets/app_sliver_grid.dart';
import '../../../core/widgets/app_sliver_list.dart';
import '../../../core/widgets/app_view_switcher.dart';
import '../../../core/widgets/custom_back_button.dart';
import '../../../core/widgets/unit_grid_card.dart';
import '../../../core/widgets/unit_list_card.dart';
import '../../home/models/unit_model.dart';
import '../viewmodels/choose_product_cubit.dart';
import '../viewmodels/choose_product_state.dart';

class ChooseProductView extends StatefulWidget {
  const ChooseProductView({required this.baseUnitId, super.key});

  final int baseUnitId;

  @override
  State<ChooseProductView> createState() => _ChooseProductViewState();
}

class _ChooseProductViewState extends State<ChooseProductView>
    with ScrollPaginationMixin<ChooseProductView> {
  late final ChooseProductCubit _cubit;
  final ValueNotifier<bool> _showScrollToTopNotifier = ValueNotifier<bool>(
    false,
  );

  @override
  void initState() {
    super.initState();
    _cubit = locator<ChooseProductCubit>();
    _loadUnits();
    scrollController.addListener(_onScrollFabVisibility);
  }

  @override
  void dispose() {
    _showScrollToTopNotifier.dispose();
    super.dispose();
  }

  @override
  void onPageFetched() {
    _cubit.loadMoreUnits(excludeId: widget.baseUnitId);
  }

  void _onScrollFabVisibility() {
    final show = scrollController.offset > 200.h;
    if (show != _showScrollToTopNotifier.value) {
      _showScrollToTopNotifier.value = show;
    }
  }

  void _loadUnits({bool isRefresh = false}) {
    _cubit.loadUnits(excludeId: widget.baseUnitId, isRefresh: isRefresh);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: Text(l10n.chooseProductTitle),
        ),
        body: InternetStateManager(
          noInternetScreen: const NoInternetScreen(),
          onRestoreInternetConnection: _loadUnits,
          child: RefreshIndicator(
            onRefresh: () async => _loadUnits(isRefresh: true),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                _buildSliverSwitcher(),
                BlocSelector<
                  ChooseProductCubit,
                  ChooseProductState,
                  ({
                    ChooseProductStatus status,
                    List<UnitModel> units,
                    String? errorMessage,
                    ViewType viewType,
                  })
                >(
                  selector: (state) => (
                    status: state.status,
                    units: state.units,
                    errorMessage: state.errorMessage,
                    viewType: state.viewType,
                  ),
                  builder: (context, data) {
                    if (data.status == ChooseProductStatus.failure &&
                        data.units.isEmpty) {
                      return _buildErrorState(data.errorMessage);
                    }

                    final isLoading =
                        data.status == ChooseProductStatus.loading &&
                        data.units.isEmpty;
                    final units = isLoading
                        ? List.generate(
                            6,
                            (index) => UnitModel.dummyUnits.first,
                          )
                        : data.units;

                    if (!isLoading && units.isEmpty) {
                      return _buildEmptyState();
                    }

                    return Skeletonizer.sliver(
                      enabled: isLoading,
                      child: data.viewType == ViewType.grid
                          ? _buildSliverGrid(units)
                          : _buildSliverList(units),
                    );
                  },
                ),
                _buildLoadMoreIndicator(),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            ),
          ),
        ),
        floatingActionButton: ValueListenableBuilder<bool>(
          valueListenable: _showScrollToTopNotifier,
          builder: (context, showScrollToTop, child) => AnimatedScale(
            scale: showScrollToTop ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: FloatingActionButton(
              mini: true,
              onPressed: scrollToTop,
              backgroundColor: context.colorScheme.primary,
              foregroundColor: context.colorScheme.onPrimary,
              child: const Icon(Icons.keyboard_arrow_up_rounded),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadMoreIndicator() =>
      BlocSelector<
        ChooseProductCubit,
        ChooseProductState,
        ({ChooseProductStatus status, bool hasUnits})
      >(
        selector: (state) =>
            (status: state.status, hasUnits: state.units.isNotEmpty),
        builder: (context, data) {
          if (data.status == ChooseProductStatus.loading && data.hasUnits) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: const Center(child: CircularProgressIndicator()),
              ),
            );
          }
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        },
      );

  Widget _buildSliverSwitcher() => SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: BlocSelector<ChooseProductCubit, ChooseProductState, ViewType>(
          selector: (state) => state.viewType,
          builder: (context, viewType) => AppViewSwitcher(
            viewType: viewType,
            onToggle: () => _cubit.toggleViewType(),
          ),
        ),
      ),
    ),
  );

  Widget _buildSliverGrid(List<UnitModel> units) => AppSliverGrid<UnitModel>(
    items: units,
    itemBuilder: (context, item) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onUnitSelected(item),
      child: AbsorbPointer(child: UnitGridCard(unit: item)),
    ),
    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
  );

  Widget _buildSliverList(List<UnitModel> units) => AppSliverList<UnitModel>(
    items: units,
    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
    separatorBuilder: (context, index) => SizedBox(height: 6.h),
    itemBuilder: (context, item) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onUnitSelected(item),
      child: AbsorbPointer(child: UnitListCard(unit: item)),
    ),
  );

  Widget _buildErrorState(String? errorMessage) => SliverFillRemaining(
    child: AppNetworkErrorWidget(
      errorMessage: errorMessage,
      onRetry: _loadUnits,
    ),
  );

  Widget _buildEmptyState() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SliverFillRemaining(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.compare_outlined,
                size: 64.sp,
                color: colorScheme.onSurfaceVariant,
              ),
              SizedBox(height: 16.h),
              Text(
                context.l10n.noProductsToCompare,
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                context.l10n.selectProductHint,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onUnitSelected(UnitModel unit) {
    context.pushNamed(
      AppRoutes.comparison,
      pathParameters: {
        'baseId': widget.baseUnitId.toString(),
        'selectedId': unit.id.toString(),
      },
    );
  }
}
