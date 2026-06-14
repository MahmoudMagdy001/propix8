import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_cubit.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_state.dart';
import 'package:propix8/feature/unit_details/views/widgets/booking_sheet.dart';
import 'package:propix8/feature/unit_details/views/widgets/contact_sheet.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UnitActionButtons extends StatelessWidget {
  const UnitActionButtons({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child:
        BlocSelector<
          UnitDetailsCubit,
          UnitDetailsState,
          ({
            RequestStatus status,
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
            final isLoading = data.status == RequestStatus.loading;
            final isActionDisabled =
                isLoading ||
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
                        onPressed: () {
                          if (data.unitId != null) {
                            unawaited(BookingSheet.show(context, data.unitId!));
                          }
                        },
                        enabled: !isActionDisabled,
                        text: data.isBookedByUser
                            ? context.l10n.alreadyBooked
                            : (data.cancelledBookingId != null
                                  ? context.l10n.rebook
                                  : context.l10n.reserveNow),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          side: BorderSide(
                            color: isActionDisabled
                                ? Colors.grey.shade200
                                : Colors.grey.shade300,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        onPressed: isActionDisabled
                            ? null
                            : () => ContactSheet.show(context),
                        child: Text(context.l10n.sendMessage),
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
