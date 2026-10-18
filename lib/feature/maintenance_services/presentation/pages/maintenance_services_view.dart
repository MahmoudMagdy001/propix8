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
import 'package:propix8/feature/maintenance_services/domain/entities/maintenance_service_entity.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_services_bloc.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_services_event.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_services_state.dart';
import 'package:propix8/feature/maintenance_services/presentation/widgets/maintenance_banner.dart';
import 'package:propix8/feature/maintenance_services/presentation/widgets/service_card.dart';
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
    if (isConnected) {
      context.read<MaintenanceServicesBloc>().add(
            const MaintenanceServicesEvent.started(),
          );
    }
  }

  @override
  void onPageFetched() {}

  void _onRefresh() {
    context.read<MaintenanceServicesBloc>().add(
          const MaintenanceServicesEvent.refreshed(),
        );
  }

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
      child: BlocBuilder<MaintenanceServicesBloc, MaintenanceServicesState>(
        builder: (context, state) {
          if (state.isFailure && state.data == null) {
            return AppNetworkErrorWidget(
              errorMessage: state.errorMessage,
              onRetry: _onRefresh,
            );
          }

          final shouldShowLoading = state.isLoading && state.data == null;
          final maintenanceData = state.data ??
              MaintenanceServicesDataEntity(
                home: [
                  MaintenanceServiceEntity(
                    id: 0,
                    title: context.l10n.homeServicePlaceholder,
                    category: context.l10n.categoryPlaceholder,
                    image: '',
                    createdAt: '',
                  ),
                  MaintenanceServiceEntity(
                    id: 1,
                    title: context.l10n.homeServicePlaceholder,
                    category: context.l10n.categoryPlaceholder,
                    image: '',
                    createdAt: '',
                  ),
                ],
                technical: [
                  MaintenanceServiceEntity(
                    id: 0,
                    title: context.l10n.technicalServicePlaceholder,
                    category: context.l10n.categoryPlaceholder,
                    image: '',
                    createdAt: '',
                  ),
                  MaintenanceServiceEntity(
                    id: 1,
                    title: context.l10n.technicalServicePlaceholder,
                    category: context.l10n.categoryPlaceholder,
                    image: '',
                    createdAt: '',
                  ),
                ],
              );

          return Skeletonizer(
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
                  if (maintenanceData.home.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Text(
                          context.l10n.homeMaintenanceServices,
                          style: context.typography.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.colors.primary,
                          ),
                        ),
                      ),
                    ),
                    AppSliverGrid<MaintenanceServiceEntity>(
                      items: maintenanceData.home,
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      itemBuilder: (context, service) => ServiceCard(
                        service: service,
                        isBooked: state.bookedServiceIds.contains(service.id),
                        onBooked: () => context
                            .read<MaintenanceServicesBloc>()
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
                          style: context.typography.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.colors.primary,
                          ),
                        ),
                      ),
                    ),
                    AppSliverGrid<MaintenanceServiceEntity>(
                      items: maintenanceData.technical,
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      itemBuilder: (context, service) => ServiceCard(
                        service: service,
                        isBooked: state.bookedServiceIds.contains(service.id),
                        onBooked: () => context
                            .read<MaintenanceServicesBloc>()
                            .markServiceAsBooked(service.id),
                      ),
                    ),
                  ],
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
