import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/maintenance_bookings/domain/entities/maintenance_booking_entity.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_bloc.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_state.dart';

class MaintenanceBookingsEmptyWidget extends StatelessWidget {
  const MaintenanceBookingsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        MaintenanceBookingsBloc,
        MaintenanceBookingsState,
        ({MaintenanceBookingsStatus status, List<MaintenanceBookingEntity> bookings})
      >(
        selector: (state) => (status: state.status, bookings: state.bookings),
        builder: (context, data) {
          if (data.bookings.isNotEmpty ||
              data.status != MaintenanceBookingsStatus.success) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }

          return SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.all(32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: context.colors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.calendar_today_outlined,
                      size: 70.sp,
                      color: context.colors.primary,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    context.l10n.noMaintenanceBookingsTitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    context.l10n.noMaintenanceBookingsSubtitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
