import 'package:flutter/material.dart';

import '../utils/context_extensions.dart';
import '../utils/responsive_helper.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    required this.text,
    super.key,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.padding,
  });

  final VoidCallback? onPressed;
  final String text;
  final Widget? icon;
  final bool isLoading;
  final bool enabled;

  final double? width;
  final double? height;

  /// Optional colors
  final Color? backgroundColor;
  final Color? foregroundColor;

  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = (enabled && !isLoading) ? onPressed : null;

    final buttonStyle =
        ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor:
              backgroundColor?.withValues(alpha: 0.2) ??
              context.colorScheme.primary.withValues(alpha: 0.2),
          disabledForegroundColor:
              (foregroundColor ?? context.colorScheme.onPrimary).withValues(
                alpha: 0.4,
              ),
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
        ).copyWith(
          fixedSize: (width != null || height != null)
              ? WidgetStateProperty.all(
                  Size(width ?? double.infinity, height ?? 50.h),
                )
              : null,
        );

    final Widget content = isLoading
        ? SizedBox(
            height: 20.h,
            width: 20.h,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: foregroundColor ?? context.colorScheme.onPrimary,
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!, SizedBox(width: 8.w)],
              Text(text, textAlign: TextAlign.center),
            ],
          );

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: effectiveOnPressed,
        style: buttonStyle,
        child: content,
      ),
    );
  }
}
