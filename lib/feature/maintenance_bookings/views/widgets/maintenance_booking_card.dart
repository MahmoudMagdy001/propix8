import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/utils/snackbar_utils.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_modal_sheet.dart';
import '../../models/maintenance_booking_model.dart';
import '../../viewmodels/maintenance_bookings_cubit.dart';
import 'edit_maintenance_booking_sheet.dart';

class MaintenanceBookingCard extends StatelessWidget {
  const MaintenanceBookingCard({
    required this.booking,
    this.onDeleted,
    super.key,
  });

  final MaintenanceBookingModel booking;
  final void Function(int serviceId)? onDeleted;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: context.theme.cardTheme.color,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Service Image and Delete Button
        Stack(
          children: [
            if (booking.service?.image != null &&
                booking.service!.image.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                child: CachedNetworkImage(
                  imageUrl: booking.service!.image,
                  memCacheHeight: 150 * 3,
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                ),
              ),
            if (booking.status.toLowerCase() == 'pending')
              Positioned(
                top: 8.h,
                left: 8.w,
                child: GestureDetector(
                  onTap: () async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          context.l10n.maintenance_bookings_card_deleteTitle,
                        ),
                        content: Text(
                          context
                              .l10n
                              .maintenance_bookings_card_deleteConfirmation,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: Text(context.l10n.cancel),
                          ),
                          AppElevatedButton(
                            onPressed: () => Navigator.pop(context, true),
                            backgroundColor: context.colorScheme.error,
                            foregroundColor: Colors.white,
                            text: context.l10n.delete,
                          ),
                        ],
                      ),
                    );

                    if (confirmed == true && context.mounted) {
                      final serviceId = booking.service?.id;
                      await context
                          .read<MaintenanceBookingsCubit>()
                          .deleteMaintenanceBooking(booking.id);
                      if (context.mounted) {
                        // Notify parent to update the services UI
                        if (serviceId != null) {
                          onDeleted?.call(serviceId);
                        }
                        context.showInfoSnackbar(
                          context.l10n.maintenance_bookings_card_deleteSuccess,
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
                    child: Icon(Icons.close, color: Colors.white, size: 20.sp),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      booking.service?.title ?? '',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _buildStatusBadge(context, booking.status),
                ],
              ),
              SizedBox(height: 12.h),

              // Date
              _buildInfoRow(
                context,
                Icons.calendar_today,
                _formatDate(booking.createdAt),
              ),
              SizedBox(height: 8.h),

              // Address
              _buildInfoRow(
                context,
                Icons.location_on,
                booking.address,
                maxLines: 2,
              ),
              SizedBox(height: 8.h),

              // Phone
              _buildInfoRow(context, Icons.phone, booking.phone),

              if (booking.status.toLowerCase() == 'pending') ...[
                SizedBox(height: 12.h),
                AppElevatedButton(
                  width: double.infinity,

                  onPressed: () async {
                    final result = await showAppModalSheet<Map<String, String>>(
                      context: context,
                      title: context.l10n.maintenance_bookings_card_editTitle,
                      child: EditMaintenanceBookingSheet(booking: booking),
                    );

                    if (result != null && context.mounted) {
                      await context
                          .read<MaintenanceBookingsCubit>()
                          .updateMaintenanceBooking(
                            id: booking.id,
                            phone: result['phone']!,
                            address: result['address']!,
                            message: result['message']!,
                          );
                      if (context.mounted) {
                        context.showSuccessSnackbar(
                          context.l10n.maintenance_bookings_card_editSuccess,
                        );
                      }
                    }
                  },
                  icon: Icon(Icons.edit, size: 18.sp),
                  text: context.l10n.maintenance_bookings_card_editButton,
                ),
              ],

              if (booking.message.isNotEmpty) ...[
                SizedBox(height: 12.h),
                const Divider(),
                SizedBox(height: 12.h),
                Text(
                  context.l10n.maintenance_bookings_card_messageLabel,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(booking.message, style: context.textTheme.bodyMedium),
              ],
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String text, {
    int maxLines = 1,
  }) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 16.sp, color: context.colorScheme.primary),
      SizedBox(width: 8.w),
      Expanded(
        child: Text(
          text,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );

  Widget _buildStatusBadge(BuildContext context, String status) {
    Color color;
    String text;

    switch (status.toLowerCase()) {
      case 'pending':
        color = Colors.orange;
        text = context.l10n.maintenance_bookings_status_pending;
      case 'contacted':
        color = Colors.blue;
        text = context.l10n.maintenance_bookings_status_contacted;
      case 'done':
        color = Colors.green;
        text = context.l10n.maintenance_bookings_status_done;
      default:
        color = Colors.grey;
        text = status;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        text,
        style: context.textTheme.bodySmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('yyyy/MM/dd HH:mm').format(date);
    } catch (e) {
      return dateStr;
    }
  }
}
