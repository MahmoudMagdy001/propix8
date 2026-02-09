import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';

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
          SizedBox(
            width: double.infinity,
            child: AppElevatedButton(
              onPressed: () => _showApproveDialog(context),
              icon: Icon(Icons.check_circle, size: 20.sp),
              text: context.l10n.approveSuggestedTime,
              backgroundColor: context.colorScheme.tertiary,
            ),
          ),
          SizedBox(height: 8.h),
        ],

        // Suggest Another Time / Edit Button
        SizedBox(
          width: double.infinity,
          child: AppElevatedButton(
            onPressed: () => _showSuggestTimeModal(context),
            icon: Icon(Icons.schedule, size: 20.sp),
            text: booking.status == 'pending'
                ? context.l10n.editBookingTime
                : context.l10n.suggestAnotherTime,
          ),
        ),

        SizedBox(height: 8.h),

        // Cancel Button
        SizedBox(
          width: double.infinity,
          child: AppElevatedButton(
            onPressed: () => _showCancelDialog(context),
            icon: Icon(Icons.cancel, size: 20.sp),
            text: context.l10n.cancelBooking,
            backgroundColor: context.colorScheme.error,
          ),
        ),
      ],
    );
  }

  Future<void> _showApproveDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.confirm),
        content: Text(context.l10n.confirmSuggestedTime),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.cancel),
          ),
          AppElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            text: context.l10n.approve,
            backgroundColor: context.colorScheme.tertiary,
          ),
        ],
      ),
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
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.confirmCancellation),
        content: Text(context.l10n.cancelBookingConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.back),
          ),
          AppElevatedButton(
            backgroundColor: context.colorScheme.error,
            onPressed: () => Navigator.pop(context, true),
            text: context.l10n.cancelBooking,
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await context.read<BookingCubit>().cancelBooking(booking.id);
      if (context.mounted) {
        context.showSuccessSnackbar(context.l10n.bookingCancelled);
      }
    }
  }
}
