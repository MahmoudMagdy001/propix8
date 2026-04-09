import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/context_extensions.dart';
import '../utils/responsive_helper.dart';

enum DialogActionType { primary, destructive, positive }

class AppConfirmationDialog extends StatelessWidget {
  const AppConfirmationDialog({
    required this.title,
    required this.message,
    required this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.actionType = DialogActionType.primary,
    super.key,
  });

  final String title;
  final String message;
  final String confirmText;
  final String? cancelText;
  final FutureOr<void> Function()? onConfirm;
  final DialogActionType actionType;

  @override
  Widget build(BuildContext context) => AlertDialog(
    backgroundColor: context.theme.cardTheme.color,
    surfaceTintColor: Colors.transparent,
    title: Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Text(message, style: context.textTheme.bodyMedium),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(false),
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
        child: Text(
          cancelText ?? context.l10n.cancel,
          style: context.textTheme.labelLarge?.copyWith(color: Colors.grey),
        ),
      ),
      SizedBox(width: 8.w),
      _buildConfirmButton(context),
    ],
  );

  Widget _buildConfirmButton(BuildContext context) {
    Color foregroundColor;

    switch (actionType) {
      case DialogActionType.destructive:
        foregroundColor = context.theme.colorScheme.error;
      case DialogActionType.positive:
        foregroundColor = Colors.green;
      case DialogActionType.primary:
        foregroundColor = context.theme.colorScheme.primary;
    }

    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(true);
        onConfirm?.call();
      },
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        textStyle: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(confirmText),
    );
  }
}

/// Helper function to show the confirmation dialog.
/// Returns `true` if confirmed, `false` or `null` otherwise.
Future<bool?> showAppConfirmationDialog(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmText,
  String? cancelText,
  FutureOr<void> Function()? onConfirm,
  DialogActionType actionType = DialogActionType.primary,
}) => showDialog<bool>(
  context: context,
  builder: (context) => AppConfirmationDialog(
    title: title,
    message: message,
    confirmText: confirmText,
    cancelText: cancelText,
    onConfirm: onConfirm,
    actionType: actionType,
  ),
);
