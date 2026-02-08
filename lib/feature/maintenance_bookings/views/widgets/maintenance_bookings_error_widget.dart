import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../models/maintenance_booking_model.dart';
import '../../viewmodels/maintenance_bookings_cubit.dart';
import '../../viewmodels/maintenance_bookings_state.dart';

class MaintenanceBookingsErrorWidget extends StatelessWidget {
  const MaintenanceBookingsErrorWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        MaintenanceBookingsCubit,
        MaintenanceBookingsState,
        ({
          RequestStatus status,
          List<MaintenanceBookingModel> bookings,
          String? errorMessage,
        })
      >(
        selector: (state) => (
          status: state.status,
          bookings: state.bookings,
          errorMessage: state.errorMessage,
        ),
        builder: (context, data) {
          if (data.status != RequestStatus.failure ||
              data.bookings.isNotEmpty) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }

          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64.sp, color: Colors.grey),
                  SizedBox(height: 16.h),
                  Text(
                    data.errorMessage ?? context.l10n.errorOccurred,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () => context
                        .read<MaintenanceBookingsCubit>()
                        .getMaintenanceBookings(),
                    child: Text(context.l10n.retry),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
