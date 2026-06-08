import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/utils/mixins/connectivity_mixin.dart';
import 'package:propix8/core/utils/mixins/scroll_pagination_mixin.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_network_error_widget.dart';
import 'package:propix8/feature/home/viewmodels/home_cubit.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';
import 'package:propix8/feature/home/views/widgets/home_all_section.dart';
import 'package:propix8/feature/home/views/widgets/home_banner_section.dart';
import 'package:propix8/feature/home/views/widgets/home_category_filters.dart';
import 'package:propix8/feature/home/views/widgets/home_header.dart';
import 'package:propix8/feature/home/views/widgets/home_latest_section.dart';
import 'package:propix8/feature/home/views/widgets/home_load_more_indicator.dart';
import 'package:propix8/feature/home/views/widgets/home_nearby_section.dart';
import 'package:propix8/feature/home/views/widgets/home_search_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, this.homeKey});
  final GlobalKey<HomeViewContentState>? homeKey;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<HomeCubit>(),
    child: Builder(
      builder: (context) => InternetStateManager(
        onRestoreInternetConnection: () =>
            context.read<HomeCubit>().fetchAllData(),
        child: HomeViewContent(key: homeKey),
      ),
    ),
  );
}

class HomeViewContent extends StatefulWidget {
  const HomeViewContent({super.key});

  @override
  State<HomeViewContent> createState() => HomeViewContentState();
}

class HomeViewContentState extends State<HomeViewContent>
    with ScrollPaginationMixin, ConnectivityMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    // Declarative initialization through mixins
    checkInitialConnectivity();
    startConnectivityListener();
  }

  @override
  void onConnectivityChanged(bool isConnected) {
    if (mounted) {
      if (isConnected) {
        context.read<HomeCubit>().fetchAllData();
      } else {
        context.read<HomeCubit>().setNetworkFailure();
      }
    }
  }

  @override
  void onPageFetched() {
    context.read<HomeCubit>().loadMoreUnits();
  }

  void scrollToTopOrRefresh() {
    if (scrollController.hasClients && scrollController.offset > 0) {
      scrollToTop();
    } else {
      _refreshIndicatorKey.currentState?.show();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.allStatus != current.allStatus ||
          previous.errorMessage != current.errorMessage,
      builder: (context, state) => RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          await context.read<HomeCubit>().fetchAllData();
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          slivers: [
            if (state.shouldShowErrorWidget)
              SliverFillRemaining(
                child: AppNetworkErrorWidget(
                  errorMessage: state.errorMessage,
                  onRetry: () => context.read<HomeCubit>().fetchAllData(),
                ),
              )
            else ...[
              const HomeHeader(),
              const HomeSearchSection(),
              const HomeBannerSection(),
              const HomeCategoryFilters(),
              const HomeNearbySection(),
              const HomeLatestSection(),
              const HomeAllSection(),
              const HomeLoadMoreIndicator(),
            ],
            SliverToBoxAdapter(child: SizedBox(height: 4.h)),
          ],
        ),
      ),
    ),
  );
}
