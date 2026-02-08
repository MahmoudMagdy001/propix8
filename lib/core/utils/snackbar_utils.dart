import 'package:flutter/material.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/core/utils/responsive_helper.dart';

import '../theme/app_colors.dart';
import 'context_extensions.dart';

class SnackbarUtils {
  static void showSnackbar(
    BuildContext context, {
    required String message,
    required SnackbarType type,
  }) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Clear existing snackbars
    scaffoldMessenger.removeCurrentSnackBar();

    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(_getIcon(type), color: Colors.white, size: 24.w),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                message,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: _getBackgroundColor(type),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void showSuccess(BuildContext context, String message) =>
      showSnackbar(context, message: message, type: SnackbarType.success);

  static void showError(BuildContext context, String message) =>
      showSnackbar(context, message: message, type: SnackbarType.error);

  static void showInfo(BuildContext context, String message) =>
      showSnackbar(context, message: message, type: SnackbarType.info);

  static void showWarning(BuildContext context, String message) =>
      showSnackbar(context, message: message, type: SnackbarType.warning);

  static IconData _getIcon(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return Icons.check_circle_outline;
      case SnackbarType.error:
        return Icons.error_outline;
      case SnackbarType.info:
        return Icons.info_outline;
      case SnackbarType.warning:
        return Icons.warning_amber_outlined;
    }
  }

  static Color _getBackgroundColor(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return AppColors.success;
      case SnackbarType.error:
        return AppColors.errorLight;
      case SnackbarType.info:
        return AppColors.info;
      case SnackbarType.warning:
        return AppColors.warning;
    }
  }
}

extension SnackbarExtension on BuildContext {
  void showSuccessSnackbar(String message) =>
      SnackbarUtils.showSuccess(this, message);

  void showErrorSnackbar(String message) =>
      SnackbarUtils.showError(this, message);

  void showInfoSnackbar(String message) =>
      SnackbarUtils.showInfo(this, message);

  void showWarningSnackbar(String message) =>
      SnackbarUtils.showWarning(this, message);
}
