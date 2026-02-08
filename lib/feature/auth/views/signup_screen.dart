import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/utils/snackbar_utils.dart';
import '../../../core/di/locator.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/terms_checkbox.dart';
import '../../../l10n/app_localizations.dart';
import '../models/auth_model.dart';
import '../viewmodels/auth_cubit.dart';
import '../viewmodels/auth_state.dart';
import 'widgets/auth_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _phoneController = TextEditingController();
  final _phoneFocusNode = FocusNode();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordController = TextEditingController();
  final _confirmPasswordFocusNode = FocusNode();
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocusNode.dispose();
    _emailController.dispose();
    _emailFocusNode.dispose();
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordController.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider.value(
      value: locator<AuthCubit>(),
      child: Scaffold(
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.status == AuthRequestStatus.success) {
              context.showSuccessSnackbar(l10n.signupSuccess);
              if (mounted) {
                context.goNamed(AppRoutes.login);
              }
            } else if (state.status == AuthRequestStatus.failure) {
              context.showErrorSnackbar(state.errorMessage ?? l10n.error);
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 50.h),
                  Text(
                    l10n.signup,
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32.h),
                  AppTextField(
                    focusNode: _nameFocusNode,
                    controller: _nameController,
                    label: l10n.name,
                    prefixIcon: const Icon(Icons.person_outline),
                    validator: (value) =>
                        value?.isEmpty ?? true ? l10n.fieldRequired : null,
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    focusNode: _emailFocusNode,
                    controller: _emailController,
                    label: l10n.email,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_outlined),
                    validator: (value) {
                      if (value?.isEmpty ?? true) return l10n.fieldRequired;
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value!)) {
                        return l10n.invalidEmail;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    focusNode: _phoneFocusNode,
                    controller: _phoneController,
                    label: l10n.phone,
                    keyboardType: TextInputType.phone,
                    prefixIcon: const Icon(Icons.phone_outlined),
                    validator: (value) =>
                        value?.isEmpty ?? true ? l10n.fieldRequired : null,
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    focusNode: _passwordFocusNode,
                    controller: _passwordController,
                    label: l10n.password,
                    isPassword: true,
                    prefixIcon: const Icon(Icons.lock_outline),
                    onFieldSubmitted: (v) => setState(() {}),
                    validator: (value) {
                      if (value?.isEmpty ?? true) return l10n.fieldRequired;
                      if (value!.length < 8) return l10n.passwordTooShort;
                      return null;
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: _passwordController,
                    builder: (context, value, child) {
                      if (value.text.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: PasswordStrengthIndicator(password: value.text),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    focusNode: _confirmPasswordFocusNode,
                    controller: _confirmPasswordController,
                    label: l10n.confirmPassword,
                    isPassword: true,
                    prefixIcon: const Icon(Icons.lock_reset_outlined),
                    validator: (value) {
                      if (value?.isEmpty ?? true) return l10n.fieldRequired;
                      if (value != _passwordController.text) {
                        return l10n.passwordsDoNotMatch;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  TermsCheckbox(
                    value: _agreedToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreedToTerms = value ?? false;
                      });
                    },
                  ),
                  SizedBox(height: 32.h),
                  BlocSelector<AuthCubit, AuthState, AuthRequestStatus>(
                    selector: (state) => state.status,
                    builder: (context, status) {
                      final isLoading = status == AuthRequestStatus.loading;
                      return ElevatedButton(
                        onPressed: (isLoading || !_agreedToTerms)
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().register(
                                    RegisterRequest(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      phone: _phoneController.text,
                                      password: _passwordController.text,
                                      passwordConfirmation:
                                          _confirmPasswordController.text,
                                    ),
                                  );
                                }
                              },
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : Text(l10n.signup_Button),
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(l10n.alreadyHaveAccount),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(l10n.login),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
