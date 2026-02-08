import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/context_extensions.dart';
import '../../core/utils/responsive_helper.dart';

/// A mixin that provides overlay and timer logic for handling double-back-press to exit.
/// This helps keep the main view clean and separates the UX logic for back press.
mixin BackExitOverlayHelper<T extends StatefulWidget> on State<T> {
  DateTime? _lastBackPressTime;
  OverlayEntry? _overlayEntry;
  Timer? _overlayTimer;

  @override
  void dispose() {
    _overlayTimer?.cancel();
    _overlayEntry?.remove();
    _overlayEntry = null;
    super.dispose();
  }

  /// Handles the back press logic.
  /// If [onNavigateBack] returns true, it means it was handled (e.g., navigated to home tab).
  /// If it returns false, it proceeds with the double-back-press logic.
  Future<void> handleBackPress({
    required bool Function() onNavigateBack,
  }) async {
    // 1. Check if we should navigate back within the layout (e.g. to Home tab)
    if (onNavigateBack()) {
      return;
    }

    // 2. Handle double-back-press logic
    final now = DateTime.now();
    if (_lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
      _lastBackPressTime = now;
      _showBackOverlay();
    } else {
      _removeOverlay();
      await _showExitDialog();
    }
  }

  void _showBackOverlay() {
    _removeOverlay();

    _overlayEntry = OverlayEntry(
      builder: (context) => Align(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              context.l10n.pressAgainToExit,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    _overlayTimer = Timer(const Duration(seconds: 2), () {
      _removeOverlay();
    });
  }

  void _removeOverlay() {
    _overlayTimer?.cancel();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Future<void> _showExitDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.exitAppConfirmationTitle),
        content: Text(context.l10n.exitAppConfirmationMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              context.l10n.exit,
              style: context.textTheme.titleMedium?.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (result == true) {
      SystemNavigator.pop();
    }
  }
}
