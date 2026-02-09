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
    SnackBarAction? action,
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
        action: action,
        backgroundColor: _getBackgroundColor(context, type),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        duration: action != null
            ? const Duration(seconds: 5)
            : const Duration(seconds: 3),
      ),
    );
  }

  static void showSuccess(
    BuildContext context,
    String message, {
    SnackBarAction? action,
  }) => showSnackbar(
    context,
    message: message,
    type: SnackbarType.success,
    action: action,
  );

  static void showError(
    BuildContext context,
    String message, {
    SnackBarAction? action,
  }) => showSnackbar(
    context,
    message: message,
    type: SnackbarType.error,
    action: action,
  );

  static void showInfo(
    BuildContext context,
    String message, {
    SnackBarAction? action,
  }) => showSnackbar(
    context,
    message: message,
    type: SnackbarType.info,
    action: action,
  );

  static void showWarning(
    BuildContext context,
    String message, {
    SnackBarAction? action,
  }) => showSnackbar(
    context,
    message: message,
    type: SnackbarType.warning,
    action: action,
  );

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

  static Color _getBackgroundColor(BuildContext context, SnackbarType type) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    switch (type) {
      case SnackbarType.success:
        return isDark ? AppColors.successDark : AppColors.successLight;
      case SnackbarType.error:
        return isDark ? AppColors.errorDark : AppColors.errorLight;
      case SnackbarType.info:
        return isDark ? AppColors.infoDark : AppColors.infoLight;
      case SnackbarType.warning:
        return isDark ? AppColors.warningDark : AppColors.warningLight;
    }
  }
}

extension SnackbarExtension on BuildContext {
  void showSuccessSnackbar(String message, {SnackBarAction? action}) =>
      SnackbarUtils.showSuccess(this, message, action: action);

  void showErrorSnackbar(String message, {SnackBarAction? action}) =>
      SnackbarUtils.showError(this, message, action: action);

  void showInfoSnackbar(String message, {SnackBarAction? action}) =>
      SnackbarUtils.showInfo(this, message, action: action);

  void showWarningSnackbar(String message, {SnackBarAction? action}) =>
      SnackbarUtils.showWarning(this, message, action: action);
}
