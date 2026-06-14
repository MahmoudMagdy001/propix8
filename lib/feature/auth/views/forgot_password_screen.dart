import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/core/widgets/app_form.dart';
import 'package:propix8/core/widgets/app_text_form_field.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/feature/auth/viewmodels/reset_password_cubit.dart';
import 'package:propix8/feature/auth/viewmodels/reset_password_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _appFormKey = GlobalKey<AppFormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider(
      create: (context) => locator<ResetPasswordCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (!ModalRoute.of(context)!.isCurrent) return;

            if (state.status == ResetPasswordStatus.emailSent) {
              context.showInfoSnackbar(
                state.successMessage ?? l10n.passwordResetConfirmation,
              );
              unawaited(context.pushNamed(
                AppRoutes.resetPasswordVerification,
                pathParameters: {'token': state.token ?? ''},
                queryParameters: {'email': _emailController.text},
              ));
            } else if (state.status == ResetPasswordStatus.failure) {
              context.showErrorSnackbar(state.errorMessage ?? l10n.error);
            }
          },
          child: AppForm(
            key: _appFormKey,
            formKey: _formKey,
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40.h),
                Image.asset('assets/images/forget_password.png', height: 200.h),

                Text(
                  l10n.forgotPassword,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 16.h),
                Text(
                  l10n.forgotPasswordSubtitle,
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 32.h),
                AppTextFormField(
                  focusNode: _emailFocusNode,
                  controller: _emailController,
                  label: l10n.email,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return l10n.fieldRequired;
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value!)) {
                      return l10n.invalidEmail;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32.h),
                BlocSelector<
                  ResetPasswordCubit,
                  ResetPasswordState,
                  ResetPasswordStatus
                >(
                  selector: (state) => state.status,
                  builder: (context, status) {
                    final isLoading = status == ResetPasswordStatus.loading;
                    return AppElevatedButton(
                      onPressed: () async {
                        if (_appFormKey.currentState?.validateAndScroll() ??
                            false) {
                          await context.read<ResetPasswordCubit>().forgotPassword(
                            _emailController.text,
                          );
                        }
                      },
                      isLoading: isLoading,
                      text: l10n.sendResetLink,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
