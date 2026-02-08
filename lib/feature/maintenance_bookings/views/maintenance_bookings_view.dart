import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_state_manager/internet_state_manager.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/mixins/connectivity_mixin.dart';
import '../../../../core/utils/mixins/scroll_pagination_mixin.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../viewmodels/maintenance_bookings_cubit.dart';
import '../viewmodels/maintenance_bookings_state.dart';
import 'widgets/maintenance_bookings_empty_widget.dart';
import 'widgets/maintenance_bookings_error_widget.dart';
import 'widgets/maintenance_bookings_sliver_list.dart';

class MaintenanceBookingsView extends StatelessWidget {
  const MaintenanceBookingsView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        locator<MaintenanceBookingsCubit>()..getMaintenanceBookings(),
    child: const _MaintenanceBookingsViewContent(),
  );
}

class _MaintenanceBookingsViewContent extends StatefulWidget {
  const _MaintenanceBookingsViewContent();

  @override
  State<_MaintenanceBookingsViewContent> createState() =>
      _MaintenanceBookingsViewContentState();
}

class _MaintenanceBookingsViewContentState
    extends State<_MaintenanceBookingsViewContent>
    with ScrollPaginationMixin, ConnectivityMixin {
  @override
  void onPageFetched() {
    context.read<MaintenanceBookingsCubit>().loadMoreMaintenanceBookings();
  }

  @override
  void onConnectivityChanged(bool isConnected) {
    if (isConnected) {
      context.read<MaintenanceBookingsCubit>().getMaintenanceBookings();
    } else {
      context.read<MaintenanceBookingsCubit>().setNetworkFailure();
    }
  }

  @override
  void initState() {
    super.initState();
    startConnectivityListener();
  }

  @override
  Widget build(
    BuildContext context,
  ) => BlocListener<MaintenanceBookingsCubit, MaintenanceBookingsState>(
    listenWhen: (previous, current) =>
        previous.status != current.status &&
        current.status == RequestStatus.failure,
    listener: (context, state) {
      if (state.bookings.isNotEmpty &&
          state.errorMessage != null &&
          state.errorMessage != 'Network Error') {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
      }
    },
    child: Scaffold(
      body: InternetStateManager(
        noInternetScreen: const NoInternetScreen(),
        onRestoreInternetConnection: () =>
            context.read<MaintenanceBookingsCubit>().getMaintenanceBookings(),
        child: RefreshIndicator(
          onRefresh: () =>
              context.read<MaintenanceBookingsCubit>().getMaintenanceBookings(),
          child: CustomScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: const CustomBackButton(),
                title: Text(context.l10n.maintenanceBookings),
                floating: true,
                snap: true,
              ),
              const MaintenanceBookingsSliverList(),
              const MaintenanceBookingsErrorWidget(),
              const MaintenanceBookingsEmptyWidget(),
              BlocBuilder<MaintenanceBookingsCubit, MaintenanceBookingsState>(
                builder: (context, state) {
                  if (state.status == RequestStatus.loading &&
                      state.bookings.isNotEmpty) {
                    return SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      sliver: const SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
