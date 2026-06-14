import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/mixins/connectivity_mixin.dart';
import 'package:propix8/core/utils/mixins/scroll_pagination_mixin.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_network_error_widget.dart';
import 'package:propix8/core/widgets/app_sliver_grid.dart';
import 'package:propix8/feature/maintenance_services/models/maintenance_service_model.dart';
import 'package:propix8/feature/maintenance_services/viewmodels/maintenance_services_cubit.dart';
import 'package:propix8/feature/maintenance_services/viewmodels/maintenance_services_state.dart';
import 'package:propix8/feature/maintenance_services/views/widgets/maintenance_banner.dart';
import 'package:propix8/feature/maintenance_services/views/widgets/service_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MaintenanceServicesView extends StatefulWidget {
  const MaintenanceServicesView({super.key});

  @override
  State<MaintenanceServicesView> createState() =>
      MaintenanceServicesViewState();
}

class MaintenanceServicesViewState extends State<MaintenanceServicesView>
    with
        ConnectivityMixin<MaintenanceServicesView>,
        ScrollPaginationMixin<MaintenanceServicesView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    unawaited(checkInitialConnectivity());
    startConnectivityListener();
  }

  @override
  void onConnectivityChanged({required bool isConnected}) {
    if (!isConnected) {
      context.read<MaintenanceServicesCubit>().setNetworkFailure();
    } else {
      unawaited(context.read<MaintenanceServicesCubit>().getMaintenanceServices());
    }
  }

  @override
  void onPageFetched() {
    // Implement pagination logic here if the API support it
    // For now, it just re-fetches or ensures we are ready for more
  }

  void _onRefresh() =>
      context.read<MaintenanceServicesCubit>().getMaintenanceServices();

  void scrollToTopOrRefresh() {
    if (scrollController.hasClients && scrollController.offset > 0) {
      scrollToTop();
    } else {
      final state = _refreshIndicatorKey.currentState;
      if (state != null) {
        unawaited(state.show());
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: InternetStateManager(
      onRestoreInternetConnection: _onRefresh,
      child: BlocBuilder<MaintenanceServicesCubit, MaintenanceServicesState>(
        buildWhen: (previous, current) =>
            previous.shouldShowErrorWidget != current.shouldShowErrorWidget,
        builder: (context, state) {
          if (state.shouldShowErrorWidget) {
            return AppNetworkErrorWidget(
              errorMessage: state.errorMessage,
              onRetry: _onRefresh,
            );
          }

          return BlocSelector<
            MaintenanceServicesCubit,
            MaintenanceServicesState,
            bool
          >(
            selector: (state) => state.shouldShowLoading,
            builder: (context, shouldShowLoading) => Skeletonizer(
              enabled: shouldShowLoading,
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () async => _onRefresh(),
                child: CustomScrollView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      title: Text(context.l10n.ourServices),
                      floating: true,
                    ),
                    const SliverToBoxAdapter(child: MaintenanceBanner()),
                    const _SliverMaintenanceServicesList(),
                    SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

class _SliverMaintenanceServicesList extends StatelessWidget {
  const _SliverMaintenanceServicesList();

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        MaintenanceServicesCubit,
        MaintenanceServicesState,
        ({MaintenanceData? data, Set<int> bookedIds})
      >(
        selector: (state) =>
            (data: state.data, bookedIds: state.bookedServiceIds),
        builder: (context, state) {
          final data = state.data;
          final bookedIds = state.bookedIds;
          final maintenanceData =
              data ??
              MaintenanceData(
                home: [
                  MaintenanceServiceModel(
                    id: 0,
                    title: context.l10n.homeServicePlaceholder,
                    category: context.l10n.categoryPlaceholder,
                    image: '',
                    createdAt: '',
                  ),
                  MaintenanceServiceModel(
                    id: 1,
                    title: context.l10n.homeServicePlaceholder,
                    category: context.l10n.categoryPlaceholder,
                    image: '',
                    createdAt: '',
                  ),
                ],
                technical: [
                  MaintenanceServiceModel(
                    id: 0,
                    title: context.l10n.technicalServicePlaceholder,
                    category: context.l10n.categoryPlaceholder,
                    image: '',
                    createdAt: '',
                  ),
                  MaintenanceServiceModel(
                    id: 1,
                    title: context.l10n.technicalServicePlaceholder,
                    category: context.l10n.categoryPlaceholder,
                    image: '',
                    createdAt: '',
                  ),
                ],
              );

          return SliverMainAxisGroup(
            slivers: [
              if (maintenanceData.home.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: Text(
                      context.l10n.homeMaintenanceServices,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                AppSliverGrid<MaintenanceServiceModel>(
                  items: maintenanceData.home,
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  itemBuilder: (context, service) => ServiceCard(
                    service: service,
                    isBooked: bookedIds.contains(service.id),
                    onBooked: () => context
                        .read<MaintenanceServicesCubit>()
                        .markServiceAsBooked(service.id),
                  ),
                ),
              ],
              if (maintenanceData.technical.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    child: Text(
                      context.l10n.technicalMaintenanceServices,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                AppSliverGrid<MaintenanceServiceModel>(
                  items: maintenanceData.technical,
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  itemBuilder: (context, service) => ServiceCard(
                    service: service,
                    isBooked: bookedIds.contains(service.id),
                    onBooked: () => context
                        .read<MaintenanceServicesCubit>()
                        .markServiceAsBooked(service.id),
                  ),
                ),
              ],
            ],
          );
        },
      );
}
