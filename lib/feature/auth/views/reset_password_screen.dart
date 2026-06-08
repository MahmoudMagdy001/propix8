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
import 'package:propix8/feature/auth/models/auth_model.dart';
import 'package:propix8/feature/auth/viewmodels/reset_password_cubit.dart';
import 'package:propix8/feature/auth/viewmodels/reset_password_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    required this.token,
    required this.email,
    super.key,
  });
  final String token;
  final String email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordController = TextEditingController();
  final _confirmPasswordFocusNode = FocusNode();
  late final _tokenController = TextEditingController(text: widget.token);
  final _appFormKey = GlobalKey<AppFormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordController.dispose();
    _confirmPasswordFocusNode.dispose();
    _tokenController.dispose();
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
            if (state.status == ResetPasswordStatus.success) {
              if (!ModalRoute.of(context)!.isCurrent) return;
              context.goNamed(AppRoutes.passwordSuccess);
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
                Text(
                  l10n.resetPassword,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 16.h),
                Text(
                  l10n.resetPasswordSubtitle,
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 32.h),

                AppTextFormField(
                  controller: _passwordController,
                  label: l10n.password,
                  isPassword: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return l10n.fieldRequired;
                    if (value!.length < 8) return l10n.passwordTooShort;
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                AppTextFormField(
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
                      onPressed: () {
                        if (_appFormKey.currentState?.validateAndScroll() ??
                            false) {
                          context.read<ResetPasswordCubit>().resetPassword(
                            ResetPasswordRequest(
                              token: _tokenController.text,
                              email: widget.email,
                              password: _passwordController.text,
                              passwordConfirmation:
                                  _confirmPasswordController.text,
                            ),
                          );
                        }
                      },
                      isLoading: isLoading,
                      text: l10n.changePassword,
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
