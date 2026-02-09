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

    final isDark = Theme.of(context).brightness == Brightness.dark;

    switch (status) {
      case 'pending':
        backgroundColor = isDark
            ? AppColors.warningDark.withValues(alpha: .1)
            : AppColors.warningLight.withValues(alpha: .1);
        textColor = isDark ? AppColors.warningDark : AppColors.warningLight;
        statusText = context.l10n.statusPending;
        icon = Icons.hourglass_empty;
      case 'accepted':
        backgroundColor = isDark
            ? AppColors.successDark.withValues(alpha: .1)
            : AppColors.successLight.withValues(alpha: .1);
        textColor = isDark ? AppColors.successDark : AppColors.successLight;
        statusText = context.l10n.statusConfirmed;
        icon = Icons.check_circle;
      case 'reschedule_admin':
        backgroundColor = isDark
            ? AppColors.infoDark.withValues(alpha: .1)
            : AppColors.infoLight.withValues(alpha: .1);
        textColor = isDark ? AppColors.infoDark : AppColors.infoLight;
        statusText = context.l10n.statusRescheduleAdmin;
        icon = Icons.update;
      case 'cancelled':
        backgroundColor = isDark
            ? AppColors.errorDark.withValues(alpha: .1)
            : AppColors.errorLight.withValues(alpha: .1);
        textColor = isDark ? AppColors.errorDark : AppColors.errorLight;
        statusText = context.l10n.statusCancelled;
        icon = Icons.cancel;
      default:
        backgroundColor = isDark
            ? Colors.grey.withValues(alpha: .1)
            : Colors.grey.withValues(alpha: .1);
        textColor = isDark ? Colors.grey : Colors.grey;
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
