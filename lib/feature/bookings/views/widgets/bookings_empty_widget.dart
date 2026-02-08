import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../models/booking_model.dart';
import '../../viewmodels/booking_cubit.dart';
import '../../viewmodels/booking_state.dart';

class BookingsEmptyWidget extends StatelessWidget {
  const BookingsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        BookingCubit,
        BookingState,
        ({RequestStatus status, List<BookingModel> bookings})
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
                  // الجزء البصري: دائرة خلفية للأيقونة لتوحيد الهوية البصرية
                  Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.primaryContainer
                          .withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons
                          .calendar_month_outlined, // أيقونة مختلفة قليلاً لتمييزها عن الصيانة
                      size: 70.sp,
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // العنوان
                  Text(
                    context.l10n.noBookingsTitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // الوصف
                  Text(
                    context.l10n.noBookingsSubtitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.theme.colorScheme.onSurfaceVariant,
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
