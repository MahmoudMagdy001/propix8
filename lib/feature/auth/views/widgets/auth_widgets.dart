import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.controller,
    required this.label,
    super.key,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.focusNode,
    this.onFieldSubmitted,
  });
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: widget.controller,
    obscureText: widget.isPassword ? _obscureText : false,
    keyboardType: widget.keyboardType,
    validator: widget.validator,
    focusNode: widget.focusNode,
    onFieldSubmitted: widget.onFieldSubmitted,
    onTapOutside: (event) => widget.focusNode?.unfocus(),

    decoration: InputDecoration(
      label: Text(widget.label),
      prefixIcon: widget.prefixIcon,
      prefixIconColor: context.colorScheme.primary,
      suffixIcon: widget.isPassword
          ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.outline,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
          : null,
    ),
  );
}

class PasswordStrengthIndicator extends StatelessWidget {
  const PasswordStrengthIndicator({required this.password, super.key});
  final String password;

  double get strength {
    if (password.isEmpty) return 0.0;
    double s = 0;
    if (password.length >= 8) s += 0.25;
    if (password.contains(RegExp(r'[A-Z]'))) s += 0.25;
    if (password.contains(RegExp(r'[0-9]'))) s += 0.25;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) s += 0.25;
    return s;
  }

  Color getColor(BuildContext context) {
    if (strength <= 0.25) return Colors.red;
    if (strength <= 0.5) return Colors.orange;
    if (strength <= 0.75) return Colors.blue;
    return Colors.green;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.passwordStrength, style: context.textTheme.bodySmall),
            Text(
              getLabel(context),
              style: context.textTheme.bodySmall?.copyWith(
                color: getColor(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        LinearProgressIndicator(
          value: strength,
          backgroundColor: Colors.grey[300],
          color: getColor(context),
          minHeight: 4.h,
        ),
      ],
    );
  }
}

//
