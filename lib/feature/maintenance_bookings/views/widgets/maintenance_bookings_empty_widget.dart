import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/maintenance_bookings/models/maintenance_booking_model.dart';
import 'package:propix8/feature/maintenance_bookings/viewmodels/maintenance_bookings_cubit.dart';
import 'package:propix8/feature/maintenance_bookings/viewmodels/maintenance_bookings_state.dart';

class MaintenanceBookingsEmptyWidget extends StatelessWidget {
  const MaintenanceBookingsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        MaintenanceBookingsCubit,
        MaintenanceBookingsState,
        ({RequestStatus status, List<MaintenanceBookingModel> bookings})
      >(
        selector: (state) => (status: state.status, bookings: state.bookings),
        builder: (context, data) {
          if (data.bookings.isNotEmpty ||
              data.status != RequestStatus.success) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }

          return SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.all(32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // الجزء البصري: دائرة خلفية للأيقونة لتعطي شكلاً أفضل
                  Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.primaryContainer
                          .withValues(alpha: 0.3),
                      shape: BoxShape.circle, // تأكد من تعريف BoxShape.circle
                    ),
                    child: Icon(
                      Icons.calendar_today_outlined, // أيقونة ألطف قليلاً
                      size: 70.sp,
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // العنوان
                  Text(
                    context.l10n.noMaintenanceBookingsTitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // الوصف
                  Text(
                    context.l10n.noMaintenanceBookingsSubtitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.theme.colorScheme.onSurfaceVariant,
                      height: 1.5, // لزيادة مقروئية النص
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
