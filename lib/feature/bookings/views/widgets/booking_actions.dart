import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/utils/snackbar_utils.dart';
import '../../../../core/widgets/app_confirmation_dialog.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_modal_sheet.dart';
import '../../models/booking_model.dart';
import '../../viewmodels/booking_cubit.dart';
import 'suggest_time_modal.dart';

class BookingActions extends StatelessWidget {
  const BookingActions({required this.booking, super.key});

  final BookingModel booking;

  @override
  Widget build(BuildContext context) {
    if (booking.status != 'pending' && booking.status != 'reschedule_admin') {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(height: 16.h),
        // Accept Button (only for reschedule_admin)
        if (booking.status == 'reschedule_admin') ...[
          AppElevatedButton(
            onPressed: () => _showApproveDialog(context),
            icon: Icon(Icons.check_circle, size: 20.sp),
            text: context.l10n.approveSuggestedTime,
            backgroundColor: context.colorScheme.tertiary,
            width: double.infinity,
          ),
          SizedBox(height: 8.h),
        ],

        // Suggest Another Time / Edit Button
        AppElevatedButton(
          width: double.infinity,

          onPressed: () => _showSuggestTimeModal(context),
          icon: Icon(Icons.schedule, size: 20.sp),
          text: booking.status == 'pending'
              ? context.l10n.editBookingTime
              : context.l10n.suggestAnotherTime,
        ),

        SizedBox(height: 8.h),

        // Cancel Button
        AppElevatedButton(
          onPressed: () => _showCancelDialog(context),
          icon: Icon(Icons.cancel, size: 20.sp),
          text: context.l10n.cancelBooking,
          backgroundColor: context.colorScheme.error,
          width: double.infinity,
        ),
      ],
    );
  }

  Future<void> _showApproveDialog(BuildContext context) async {
    final confirmed = await showAppConfirmationDialog(
      context,
      title: context.l10n.confirm,
      message: context.l10n.confirmSuggestedTime,
      confirmText: context.l10n.approve,
      actionType: DialogActionType.positive,
    );

    if (confirmed == true && context.mounted) {
      await context.read<BookingCubit>().acceptBooking(booking.id);
      if (context.mounted) {
        context.showSuccessSnackbar(context.l10n.suggestedTimeAccepted);
      }
    }
  }

  Future<void> _showSuggestTimeModal(BuildContext context) async {
    final buttonText = booking.status == 'pending'
        ? context.l10n.editBookingTime
        : context.l10n.suggestAnotherTime;
    final result = await showAppModalSheet<Map<String, String>>(
      context: context,
      title: buttonText,
      child: const SuggestTimeModal(),
    );

    if (result != null && context.mounted) {
      await context.read<BookingCubit>().suggestNewTime(
        bookingId: booking.id,
        date: result['date']!,
        time: result['time']!,
        userMessage: result['message'] ?? '',
      );
      if (context.mounted) {
        context.showSuccessSnackbar(context.l10n.newTimeSuggestionSent);
      }
    }
  }

  Future<void> _showCancelDialog(BuildContext context) async {
    final confirmed = await showAppConfirmationDialog(
      context,
      title: context.l10n.confirmCancellation,
      message: context.l10n.cancelBookingConfirmation,
      confirmText: context.l10n.cancelBooking,
      actionType: DialogActionType.destructive,
    );

    if (confirmed == true && context.mounted) {
      await context.read<BookingCubit>().cancelBooking(booking.id);
      if (context.mounted) {
        context.showSuccessSnackbar(context.l10n.bookingCancelled);
      }
    }
  }
}
