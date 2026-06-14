import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';

class TermsCheckbox extends StatelessWidget {
  const TermsCheckbox({
    required this.value,
    required this.onChanged,
    super.key,
  });
  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: context.textTheme.bodyMedium,
              children: [
                TextSpan(text: l10n.agreeToTermsPart1),
                TextSpan(
                  text: l10n.agreeToTermsPart2,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      unawaited(context.pushNamed(AppRoutes.terms));
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
