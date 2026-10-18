import 'package:flutter/material.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  const PasswordStrengthIndicator({required this.password, super.key});
  final String password;

  double get strength {
    if (password.isEmpty) return 0.0;
    double s = 0;
    if (password.length >= 8) s += 0.25;
    if (password.contains(RegExp('[A-Z]'))) s += 0.25;
    if (password.contains(RegExp('[0-9]'))) s += 0.25;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) s += 0.25;
    return s;
  }

  Color getColor(BuildContext context) {
    if (strength <= 0.25) return context.colors.error;
    if (strength <= 0.5) return context.colors.warning;
    if (strength <= 0.75) return context.colors.info;
    return context.colors.success;
  }

  String getLabel(BuildContext context) {
    final l10n = context.l10n;
    if (strength <= 0.25) return l10n.weak;
    if (strength <= 0.5) return l10n.fair;
    if (strength <= 0.75) return l10n.good;
    return l10n.strong;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bodySmall = context.typography.bodySmall ?? const TextStyle();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.passwordStrength, style: bodySmall),
            Text(
              getLabel(context),
              style: bodySmall.copyWith(
                color: getColor(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        LinearProgressIndicator(
          value: strength,
          backgroundColor: context.colors.border.withValues(alpha: 0.3),
          color: getColor(context),
          minHeight: 4.h,
        ),
      ],
    );
  }
}
