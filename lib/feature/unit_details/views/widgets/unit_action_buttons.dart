import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../viewmodels/unit_details_cubit.dart';
import '../../viewmodels/unit_details_state.dart';
import 'booking_sheet.dart';
import 'contact_sheet.dart';

class UnitActionButtons extends StatelessWidget {
  const UnitActionButtons({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
      builder: (context, state) {
        final unit = state.unit;
        final isLoading = state.status == RequestStatus.loading;
        final isActionDisabled =
            isLoading ||
            state.isBookedByUser ||
            (unit != null &&
                (unit.status.toLowerCase() == 'sold' ||
                    unit.status.toLowerCase() == 'rented'));

        return Skeletonizer(
          enabled: isLoading,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppElevatedButton(
                    onPressed: () {
                      if (unit != null) {
                        BookingSheet.show(context, unit.id);
                      }
                    },
                    enabled: !isActionDisabled,
                    text: state.isBookedByUser
                        ? context.l10n.alreadyBooked
                        : (state.cancelledBookingId != null
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
