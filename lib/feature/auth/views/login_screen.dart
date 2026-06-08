import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/auth_constants.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/core/widgets/app_form.dart';
import 'package:propix8/core/widgets/app_text_form_field.dart';
import 'package:propix8/feature/auth/viewmodels/auth_cubit.dart';
import 'package:propix8/feature/auth/viewmodels/auth_state.dart';

/// Login screen for user authentication.
///
/// IMPROVEMENTS vs original:
/// 1. Button debouncing to prevent double-tap duplicate submissions
/// 2. Proper FocusNode disposal (was missing before)
/// 3. Mounted checks before setState after async operations
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  Timer? _resendTimer;
  int _cooldownSeconds = 0;

  // DEBOUNCING: Prevent double-tap on login button
  // WHY: Users may tap login button multiple times, causing duplicate requests.
  // While repository also has debouncing, UI-level prevention provides
  // immediate visual feedback and prevents unnecessary work.
  bool _isSubmitting = false;

  final _appFormKey = GlobalKey<AppFormState>();

  @override
  void dispose() {
    // RESOURCE CLEANUP: Dispose all controllers and focus nodes
    _emailController.dispose();
    _passwordController.dispose();
    // FIX: FocusNodes were not being disposed, causing memory leak
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _resendTimer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    // MOUNTED CHECK: Ensure widget is still mounted before setState
    if (!mounted) return;

    setState(() {
      _cooldownSeconds = 120; // 2 minutes
    });
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_cooldownSeconds > 0) {
        // MOUNTED CHECK: Verify widget still exists before updating state
        if (mounted) {
          setState(() {
            _cooldownSeconds--;
          });
        }
      } else {
        timer.cancel();
      }
    });
  }

  /// Handle login button press with debouncing.
  void _handleLogin(BuildContext context) {
    // DEBOUNCING: Ignore if already submitting
    if (_isSubmitting) return;

    // Validate form first
    if (_appFormKey.currentState?.validateAndScroll() != true) return;

    // Set submitting flag
    setState(() => _isSubmitting = true);

    // Trigger login
    context.read<AuthCubit>().login(
      _emailController.text,
      _passwordController.text,
    );

    // Reset debounce after delay (even if login fails, allow retry)
    Future.delayed(AuthConstants.buttonDebounceDelay, () {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider.value(
      value: locator<AuthCubit>(),
      child: Scaffold(
        body: MultiBlocListener(
          listeners: [
            BlocListener<AuthCubit, AuthState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) {
                if (state.status == AuthRequestStatus.success) {
                  context.showSuccessSnackbar(l10n.loginSuccess);
                  // Navigation handled by Router Redirect
                } else if (state.status == AuthRequestStatus.failure) {
                  context.showErrorSnackbar(state.errorMessage ?? l10n.error);
                }
              },
            ),
            BlocListener<AuthCubit, AuthState>(
              listenWhen: (previous, current) =>
                  previous.resendStatus != current.resendStatus,
              listener: (context, state) {
                if (state.resendStatus == AuthRequestStatus.success) {
                  _startResendTimer();
                  context.showSuccessSnackbar(l10n.verificationEmailSent);
                } else if (state.resendStatus == AuthRequestStatus.failure) {
                  context.showErrorSnackbar(state.resendMessage ?? l10n.error);
                }
              },
            ),
          ],
          child: AppForm(
            key: _appFormKey,
            formKey: _formKey,
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 150.h,
                  color: context.colorScheme.primary,
                ),
                SizedBox(height: 40.h),
                AppTextFormField(
                  focusNode: _emailFocusNode,
                  controller: _emailController,
                  label: l10n.email,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.fieldRequired;
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return l10n.invalidEmail;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                AppTextFormField(
                  focusNode: _passwordFocusNode,
                  controller: _passwordController,
                  label: l10n.password,
                  isPassword: true,
                  prefixIcon: const Icon(Icons.lock_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.fieldRequired;
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () =>
                        context.pushNamed(AppRoutes.forgotPassword),
                    child: Text(l10n.forgotPassword),
                  ),
                ),
                SizedBox(height: 20.h),
                BlocSelector<AuthCubit, AuthState, AuthRequestStatus>(
                  selector: (state) => state.status,
                  builder: (context, status) {
                    final isLoading = status == AuthRequestStatus.loading;
                    return AppElevatedButton(
                      onPressed: () => _handleLogin(context),
                      isLoading: isLoading,
                      enabled: !_isSubmitting,
                      text: l10n.login,
                    );
                  },
                ),
                // Show resend verification option if error indicates unverified email
                BlocSelector<AuthCubit, AuthState, String?>(
                  selector: (state) => state.errorMessage,
                  builder: (context, errorMessage) {
                    final showResend =
                        errorMessage != null &&
                        (errorMessage.contains('verified') ||
                            errorMessage.contains('مفعل'));
                    if (!showResend) return const SizedBox.shrink();

                    return Column(
                      children: [
                        SizedBox(height: 16.h),
                        BlocSelector<AuthCubit, AuthState, AuthRequestStatus>(
                          selector: (state) => state.resendStatus,
                          builder: (context, resendStatus) {
                            final isResending =
                                resendStatus == AuthRequestStatus.loading;
                            return TextButton(
                              onPressed: isResending || _cooldownSeconds > 0
                                  ? null
                                  : () {
                                      context
                                          .read<AuthCubit>()
                                          .resendVerificationEmail(
                                            _emailController.text,
                                          );
                                    },
                              child: isResending
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      _cooldownSeconds > 0
                                          ? '${l10n.resendVerification} ${_cooldownSeconds}s'
                                          : l10n.resendVerification,
                                    ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(l10n.dontHaveAccount),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(AppRoutes.register);
                      },
                      child: Text(l10n.signup),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
