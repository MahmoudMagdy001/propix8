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
import 'package:propix8/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_state.dart';

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
  bool _isSubmitting = false;

  final _appFormKey = GlobalKey<AppFormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _resendTimer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    if (!mounted) return;

    setState(() {
      _cooldownSeconds = 120;
    });
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_cooldownSeconds > 0) {
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

  Future<void> _handleLogin(BuildContext context) async {
    if (_isSubmitting) return;

    if (_appFormKey.currentState?.validateAndScroll() != true) return;

    setState(() => _isSubmitting = true);

    await context.read<AuthBloc>().login(
      _emailController.text,
      _passwordController.text,
    );

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
      value: locator<AuthBloc>(),
      child: Scaffold(
        body: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) {
                if (state.status == AuthRequestStatus.success) {
                  context.showSuccessSnackbar(l10n.loginSuccess);
                } else if (state.status == AuthRequestStatus.failure) {
                  context.showErrorSnackbar(state.errorMessage ?? l10n.error);
                }
              },
            ),
            BlocListener<AuthBloc, AuthState>(
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
                  color: context.colors.primary,
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
                  prefixIcon: const Icon(Icons.lock_outline),
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
                BlocSelector<AuthBloc, AuthState, AuthRequestStatus>(
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
                BlocSelector<AuthBloc, AuthState, String?>(
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
                        BlocSelector<AuthBloc, AuthState, AuthRequestStatus>(
                          selector: (state) => state.resendStatus,
                          builder: (context, resendStatus) {
                            final isResending =
                                resendStatus == AuthRequestStatus.loading;
                            return TextButton(
                              onPressed: isResending || _cooldownSeconds > 0
                                  ? null
                                  : () async {
                                      await context
                                          .read<AuthBloc>()
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
                        unawaited(context.pushNamed(AppRoutes.register));
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
