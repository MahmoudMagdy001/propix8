import 'package:flutter/material.dart';

/// A wrapper widget that handles the [PopScope] logic for the Layout feature.
/// This prevents the LayoutView from being cluttered with back-press handling boilerplate.
class LayoutPopHandler extends StatelessWidget {
  const LayoutPopHandler({
    required this.child,
    required this.onPopInvoked,
    super.key,
  });

  final Widget child;
  final PopInvokedWithResultCallback<Object?> onPopInvoked;

  @override
  Widget build(BuildContext context) => PopScope(
    canPop:
        false, // We handle the pop manually (e.g., showing exit dialog or switching tabs)
    onPopInvokedWithResult: onPopInvoked,
    child: child,
  );
}
