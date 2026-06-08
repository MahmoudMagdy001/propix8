import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.color, this.onPressed});

  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (!context.canPop()) {
      return const SizedBox.shrink();
    }

    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: color ?? context.colorScheme.primary,
        size: 20.r,
      ),
      onPressed: onPressed ?? () => context.pop(),
    );
  }
}
