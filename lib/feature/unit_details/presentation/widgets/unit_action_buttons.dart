import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/booking_sheet.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/contact_sheet.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UnitActionButtons extends StatelessWidget {
  const UnitActionButtons({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: BlocSelector<
          UnitDetailsBloc,
          UnitDetailsState,
          ({
            HomeRequestStatus status,
            bool isBookedByUser,
            int? cancelledBookingId,
            int? unitId,
            String? unitStatus,
          })
        >(
          selector: (state) => (
            status: state.status,
            isBookedByUser: state.isBookedByUser,
            cancelledBookingId: state.cancelledBookingId,
            unitId: state.unit?.id,
            unitStatus: state.unit?.status,
          ),
          builder: (context, data) {
            final isLoading = data.status == HomeRequestStatus.loading;
            final isActionDisabled = isLoading ||
                data.isBookedByUser ||
                (data.unitStatus != null &&
                    (data.unitStatus!.toLowerCase() == 'sold' ||
                        data.unitStatus!.toLowerCase() == 'rented'));

            return Skeletonizer(
              enabled: isLoading,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                  vertical: 10.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: AppElevatedButton(
                        text: data.isBookedByUser
                            ? context.l10n.alreadyBooked
                            : context.l10n.reserveNow,
                        onPressed: () {
                          if (data.unitId != null) {
                            unawaited(
                              BookingSheet.show(context, data.unitId!),
                            );
                          }
                        },
                        enabled: !isActionDisabled,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      flex: 2,
                      child: AppElevatedButton(
                        text: context.l10n.contactOwner,
                        backgroundColor:
                            context.colorScheme.surfaceContainerHighest,
                        foregroundColor: context.colorScheme.onSurface,
                        onPressed: () {
                          unawaited(ContactSheet.show(context));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
