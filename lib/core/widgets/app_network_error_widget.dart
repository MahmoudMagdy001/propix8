import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:propix8/core/utils/context_extensions.dart';

class AppNetworkErrorWidget extends StatelessWidget {
  const AppNetworkErrorWidget({
    required this.onRetry,
    super.key,
    this.errorMessage,
    this.title,
    this.icon,
  });

  final String? errorMessage;
  final VoidCallback onRetry;
  final String? title;
  final IconData? icon;

  bool get _isNetworkError {
    final error = errorMessage?.toLowerCase() ?? '';
    return error.contains('connection') ||
        error.contains('host lookup') ||
        error.contains('internet') ||
        error.contains('network') ||
        error.contains('socket');
  }

  @override
  Widget build(BuildContext context) {
    final isNetwork = _isNetworkError;
    // You might want to grab these strings from l10n, but for now we'll default
    // to passed values or hardcoded fallbacks to match the request "friendly UI".
    final displayTitle =
        title ??
        (isNetwork ? context.l10n.noInternetTitle : context.l10n.error);
    final displayMessage = (isNetwork
        ? context.l10n.noInternetSubtitle
        : errorMessage ?? context.l10n.error);
    final displayIcon =
        icon ??
        (isNetwork ? Icons.wifi_off_rounded : Icons.error_outline_rounded);

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              displayIcon,
              size: 80.sp,
              color: context.colorScheme.error.withValues(alpha: 0.5),
            ),
            SizedBox(height: 16.h),
            Text(
              displayTitle,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              displayMessage,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 24.h),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(context.l10n.tryAgainText),
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
