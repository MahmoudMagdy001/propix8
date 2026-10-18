import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/feature/maintenance_bookings/domain/entities/maintenance_booking_entity.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_bloc.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_event.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_state.dart';

class MaintenanceBookingsErrorWidget extends StatelessWidget {
  const MaintenanceBookingsErrorWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        MaintenanceBookingsBloc,
        MaintenanceBookingsState,
        ({
          MaintenanceBookingsStatus status,
          List<MaintenanceBookingEntity> bookings,
          String? errorMessage,
        })
      >(
        selector: (state) => (
          status: state.status,
          bookings: state.bookings,
          errorMessage: state.errorMessage,
        ),
        builder: (context, data) {
          if (data.status != MaintenanceBookingsStatus.failure ||
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
                  AppElevatedButton(
                    onPressed: () => context
                        .read<MaintenanceBookingsBloc>()
                        .add(const MaintenanceBookingsEvent.fetchInitial()),
                    text: context.l10n.retry,
                  ),
                ],
              ),
            ),
          );
        },
      );
}
