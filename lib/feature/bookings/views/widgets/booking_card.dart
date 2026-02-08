import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/utils/date_time_utils.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_modal_sheet.dart';
import '../../models/booking_model.dart';
import '../../viewmodels/booking_cubit.dart';
import 'suggest_time_modal.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({required this.booking, super.key});

  final BookingModel booking;

  @override
  Widget build(BuildContext context) {
    final isDark = context.theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: context.theme.cardTheme.color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Unit Image and Title
          if (booking.unit.mainImage.isNotEmpty)
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.r),
                  ),
                  child: CachedNetworkImage(
                    memCacheHeight: 180 * 3,
                    imageUrl: booking.unit.mainImage,
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: GestureDetector(
                    onTap: () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(context.l10n.deleteBooking),
                          content: Text(context.l10n.deleteBookingConfirmation),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text(context.l10n.cancel),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, true),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.colorScheme.error,
                                foregroundColor: Colors.white,
                              ),
                              child: Text(context.l10n.delete),
                            ),
                          ],
                        ),
                      );

                      if (confirmed == true && context.mounted) {
                        await context.read<BookingCubit>().deleteBooking(
                          booking.id,
                        );
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(context.l10n.bookingDeletedSuccess),
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),

          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Unit Title
                Text(
                  booking.unit.title,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),

                // Address
                if (booking.unit.address.isNotEmpty) ...[
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16.sp, color: Colors.grey),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          booking.unit.address,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                ],

                // Divider
                Divider(height: 1.h),
                SizedBox(height: 12.h),

                // Booking Info
                _buildInfoRow(
                  context,
                  Icons.person,
                  context.l10n.name,
                  booking.name,
                ),
                SizedBox(height: 8.h),
                _buildInfoRow(
                  context,
                  Icons.email,
                  context.l10n.email,
                  booking.email,
                ),
                SizedBox(height: 8.h),
                _buildInfoRow(
                  context,
                  Icons.phone,
                  context.l10n.phone,
                  booking.phone,
                ),
                SizedBox(height: 8.h),
                _buildInfoRow(
                  context,
                  Icons.calendar_today,
                  booking.status == 'reschedule_admin'
                      ? context.l10n.suggestedDate
                      : context.l10n.date,
                  _formatDate(booking.date, context),
                ),
                SizedBox(height: 8.h),
                _buildInfoRow(
                  context,
                  Icons.access_time,
                  booking.status == 'reschedule_admin'
                      ? context.l10n.suggestedTime
                      : context.l10n.time,
                  DateTimeUtils.formatTimeForDisplay(
                    DateTimeUtils.parseApiTime(booking.time),
                  ),
                ),

                // Notes (Admin)
                if (booking.notes != null && booking.notes!.isNotEmpty) ...[
                  SizedBox(height: 12.h),
                  Divider(height: 1.h),
                  SizedBox(height: 12.h),
                  Text(
                    '${context.l10n.adminNotes}:',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(booking.notes!, style: context.textTheme.bodySmall),
                ],

                // User Message
                if (booking.userMessage != null &&
                    booking.userMessage!.isNotEmpty) ...[
                  SizedBox(height: 12.h),
                  if (booking.notes == null || booking.notes!.isEmpty)
                    Divider(height: 1.h),
                  SizedBox(height: 12.h),
                  Text(
                    '${context.l10n.yourMessage}:',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    booking.userMessage!,
                    style: context.textTheme.bodySmall,
                  ),
                ],

                // Status Badge
                SizedBox(height: 16.h),
                _buildStatusBadge(context, booking.status, isDark),

                // Action Buttons for pending and reschedule_admin
                if (booking.status == 'pending' ||
                    booking.status == 'reschedule_admin') ...[
                  SizedBox(height: 16.h),
                  _buildActionButtons(context, booking.status),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) => Row(
    children: [
      Icon(icon, size: 16.sp, color: Colors.grey),
      SizedBox(width: 8.w),
      Text(
        '$label: ',
        style: context.textTheme.bodySmall?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      Expanded(
        child: Text(
          value,
          style: context.textTheme.bodySmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );

  Widget _buildStatusBadge(BuildContext context, String status, bool isDark) {
    Color backgroundColor;
    Color textColor;
    String statusText;
    IconData icon;

    switch (status) {
      case 'pending':
        backgroundColor = AppColors.warning.withValues(alpha: .1);
        textColor = AppColors.warning;
        statusText = context.l10n.statusPending;
        icon = Icons.hourglass_empty;
      case 'accepted':
        backgroundColor = AppColors.success.withValues(alpha: .1);
        textColor = AppColors.success;
        statusText = context.l10n.statusConfirmed;
        icon = Icons.check_circle;
      case 'reschedule_admin':
        backgroundColor = AppColors.info.withValues(alpha: .1);
        textColor = AppColors.info;
        statusText = context.l10n.statusRescheduleAdmin;
        icon = Icons.update;

      case 'cancelled':
        backgroundColor = AppColors.errorLight.withValues(alpha: .1);
        textColor = AppColors.errorLight;
        statusText = context.l10n.statusCancelled;
        icon = Icons.cancel;
      default:
        backgroundColor = Colors.grey.withValues(alpha: .1);
        textColor = Colors.grey;
        statusText = status;
        icon = Icons.info;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18.sp, color: textColor),
          SizedBox(width: 8.w),
          Text(
            statusText,
            style: context.textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, String status) => Column(
    children: [
      // Accept Button (only for reschedule_admin)
      if (status == 'reschedule_admin') ...[
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () async {
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
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(context.l10n.approve),
                    ),
                  ],
                ),
              );

              if (confirmed == true && context.mounted) {
                await context.read<BookingCubit>().acceptBooking(booking.id);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(context.l10n.suggestedTimeAccepted)),
                  );
                }
              }
            },
            icon: Icon(Icons.check_circle, size: 20.sp),
            label: Text(context.l10n.approveSuggestedTime),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.success,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
      ],

      // Suggest Another Time / Edit Button
      SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: () async {
            final buttonText = status == 'pending'
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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(context.l10n.newTimeSuggestionSent)),
                );
              }
            }
          },
          icon: Icon(Icons.schedule, size: 20.sp),
          label: Text(
            status == 'pending'
                ? context.l10n.editBookingTime
                : context.l10n.suggestAnotherTime,
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: context.colorScheme.primary,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            side: BorderSide(color: context.colorScheme.primary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ),
      SizedBox(height: 8.h),

      // Cancel Button
      SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: () async {
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
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorScheme.error,
                    ),
                    child: Text(context.l10n.cancelBooking),
                  ),
                ],
              ),
            );

            if (confirmed == true && context.mounted) {
              await context.read<BookingCubit>().cancelBooking(booking.id);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(context.l10n.bookingCancelled)),
                );
              }
            }
          },
          icon: Icon(Icons.cancel, size: 20.sp),
          label: Text(context.l10n.cancelBooking),
          style: OutlinedButton.styleFrom(
            foregroundColor: context.colorScheme.error,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            side: BorderSide(color: context.colorScheme.error),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ),
    ],
  );

  String _formatDate(String date, BuildContext context) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat(
        'yyyy/MM/dd',
        context.l10n.localeName,
      ).format(parsedDate);
    } catch (e) {
      return date;
    }
  }
}
