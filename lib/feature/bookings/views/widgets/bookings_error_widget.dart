import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/feature/bookings/models/booking_model.dart';
import 'package:propix8/feature/bookings/viewmodels/booking_cubit.dart';
import 'package:propix8/feature/bookings/viewmodels/booking_state.dart';

class BookingsErrorWidget extends StatelessWidget {
  const BookingsErrorWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        BookingCubit,
        BookingState,
        ({
          RequestStatus status,
          List<BookingModel> bookings,
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
                  AppElevatedButton(
                    onPressed: () =>
                        context.read<BookingCubit>().fetchBookings(),
                    text: context.l10n.retry,
                  ),
                ],
              ),
            ),
          );
        },
      );
}
