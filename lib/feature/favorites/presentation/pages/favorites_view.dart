import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_network_error_widget.dart';
import 'package:propix8/core/widgets/app_sliver_grid.dart';
import 'package:propix8/core/widgets/app_sliver_list.dart';
import 'package:propix8/core/widgets/app_view_switcher.dart';
import 'package:propix8/core/widgets/unit_grid_card.dart';
import 'package:propix8/core/widgets/unit_list_card.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_unit_entity.dart';
import 'package:propix8/feature/favorites/presentation/bloc/favorite_bloc.dart';
import 'package:propix8/feature/favorites/presentation/bloc/favorite_event.dart';
import 'package:propix8/feature/favorites/presentation/bloc/favorite_state.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => FavoritesViewState();
}

class FavoritesViewState extends State<FavoritesView> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  void scrollToTopOrRefresh() {
    if (_scrollController.hasClients && _scrollController.offset > 0) {
      unawaited(
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        ),
      );
    } else {
      unawaited(_refreshIndicatorKey.currentState?.show());
    }
  }

  @override
  void initState() {
    super.initState();
    context
        .read<FavoriteBloc>()
        .add(const FavoriteEvent.getFavoritesRequested());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<FavoriteBloc>().add(
            const FavoriteEvent.getFavoritesRequested(isLoadMore: true),
          );
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
        body: InternetStateManager(
          onRestoreInternetConnection: () => context
              .read<FavoriteBloc>()
              .add(const FavoriteEvent.getFavoritesRequested(forceRefresh: true)),
          child: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
              context
                  .read<FavoriteBloc>()
                  .add(const FavoriteEvent.getFavoritesRequested(forceRefresh: true));
            },
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  floating: true,
                  title: Text(context.l10n.navFavorites),
                ),
                _buildSliverSwitcher(),
                BlocSelector<
                  FavoriteBloc,
                  FavoriteState,
                  ({
                    FavoriteStatus listStatus,
                    List<FavoriteUnitEntity> favoriteUnits,
                    ViewType viewType,
                  })
                >(
                  selector: (state) => (
                    listStatus: state.listStatus,
                    favoriteUnits: state.favoriteUnits,
                    viewType: state.viewType,
                  ),
                  builder: (context, data) {
                    final listStatus = data.listStatus;
                    final favoriteUnits = data.favoriteUnits;
                    final viewType = data.viewType;

                    if (listStatus == FavoriteStatus.failure &&
                        favoriteUnits.isEmpty) {
                      return _buildErrorState();
                    }

                    final isLoading =
                        listStatus == FavoriteStatus.loading &&
                        favoriteUnits.isEmpty;
                    final units = isLoading
                        ? List.generate(
                            6,
                            (index) => FavoriteUnitEntity(
                              id: index,
                              unit: UnitEntity.dummyUnits[0],
                              createdAt: DateTime.now(),
                            ),
                          )
                        : favoriteUnits;

                    if (!isLoading && units.isEmpty) {
                      return _buildEmptyState();
                    }

                    return Skeletonizer.sliver(
                      enabled: isLoading,
                      child: viewType == ViewType.grid
                          ? _buildSliverGrid(units)
                          : _buildSliverList(units),
                    );
                  },
                ),
                BlocSelector<
                  FavoriteBloc,
                  FavoriteState,
                  ({bool hasMore, FavoriteStatus status})
                >(
                  selector: (state) =>
                      (hasMore: state.hasMore, status: state.listStatus),
                  builder: (context, data) {
                    if (data.hasMore) {
                      return SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          child:
                              const Center(child: CircularProgressIndicator()),
                        ),
                      );
                    }
                    return const SliverToBoxAdapter(
                      child: SizedBox(height: 20),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildSliverGrid(List<FavoriteUnitEntity> units) =>
      AppSliverGrid<FavoriteUnitEntity>(
        items: units,
        itemBuilder: (context, item) => UnitGridCard(unit: item.unit),
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
      );

  Widget _buildSliverList(List<FavoriteUnitEntity> units) =>
      AppSliverList<FavoriteUnitEntity>(
        items: units,
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        separatorBuilder: (context, index) => SizedBox(height: 6.h),
        itemBuilder: (context, item) => UnitListCard(unit: item.unit),
      );

  Widget _buildSliverSwitcher() => SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: BlocSelector<FavoriteBloc, FavoriteState, ViewType>(
              selector: (state) => state.viewType,
              builder: (context, viewType) => AppViewSwitcher(
                viewType: viewType,
                onToggle: () => context
                    .read<FavoriteBloc>()
                    .add(const FavoriteEvent.favoriteViewTypeToggled()),
              ),
            ),
          ),
        ),
      );

  Widget _buildErrorState() => SliverFillRemaining(
        child: BlocSelector<FavoriteBloc, FavoriteState, String?>(
          selector: (state) => state.errorMessage,
          builder: (context, errorMessage) => AppNetworkErrorWidget(
            errorMessage: errorMessage,
            onRetry: () => context
                .read<FavoriteBloc>()
                .add(const FavoriteEvent.getFavoritesRequested()),
          ),
        ),
      );

  Widget _buildEmptyState() => SliverFillRemaining(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border_rounded,
                size: 80.sp,
                color: context.colors.secondary.withValues(alpha: 0.5),
              ),
              SizedBox(height: 24.h),
              Text(
                context.l10n.noFavoritesTitle,
                textAlign: TextAlign.center,
                style: context.typography.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                context.l10n.noFavoritesSubtitle,
                textAlign: TextAlign.center,
                style: context.typography.bodyMedium?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
}
