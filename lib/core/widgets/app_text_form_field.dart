import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/context_extensions.dart';
import '../utils/responsive_helper.dart';
import 'app_form.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    required this.label,
    super.key,
    this.controller,
    this.hint,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.textInputAction,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  final TextEditingController? controller;
  final String label;
  final String? hint;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final int? maxLines;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
  final AutovalidateMode autovalidateMode;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _obscureText = true;
  final _fieldKey = GlobalKey<FormFieldState>();
  AppFormState? _formState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    try {
      final newState = AppForm.of(context);
      if (_formState != newState) {
        _formState?.unregisterField(_fieldKey);
        _formState = newState;
        _formState?.registerField(_fieldKey);
      }
    } catch (_) {
      // Not inside an AppForm
      _formState?.unregisterField(_fieldKey);
      _formState = null;
    }
  }

  @override
  void dispose() {
    _formState?.unregisterField(_fieldKey);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
    key: _fieldKey,
    controller: widget.controller,
    obscureText: widget.isPassword ? _obscureText : false,
    keyboardType: widget.keyboardType,
    validator: widget.validator,
    focusNode: widget.focusNode,
    onFieldSubmitted: widget.onFieldSubmitted,
    onChanged: widget.onChanged,
    maxLines: widget.maxLines,
    enabled: widget.enabled,
    readOnly: widget.readOnly,
    onTap: widget.onTap,
    textInputAction: widget.textInputAction,
    autovalidateMode: widget.autovalidateMode,
    onTapOutside: (event) {
      widget.focusNode?.unfocus();
      FocusScope.of(context).unfocus();
    },
    decoration: InputDecoration(
      labelText: widget.label,
      hintText: widget.hint,
      prefixIcon: widget.prefixIcon,
      prefixIconColor: context.colorScheme.primary,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.outline.withAlpha(50)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: context.colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: context.colorScheme.error),
      ),
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
          : widget.suffixIcon,
    ),
  );
}
