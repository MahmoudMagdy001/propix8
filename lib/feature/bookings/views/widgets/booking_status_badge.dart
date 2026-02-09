import 'package:flutter/material.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';

import '../../../../core/theme/app_colors.dart';

class BookingStatusBadge extends StatelessWidget {
  const BookingStatusBadge({required this.status, super.key});

  final String status;

  @override
  Widget build(BuildContext context) {
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
}
