import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/core/widgets/app_form.dart';
import 'package:propix8/core/widgets/app_text_form_field.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/feature/profile/viewmodels/user_profile_cubit.dart';
import 'package:propix8/feature/profile/viewmodels/user_profile_state.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _appFormKey = GlobalKey<AppFormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_appFormKey.currentState!.validateAndScroll()) {
      final data = {
        'current_password': _currentPasswordController.text,
        'password': _newPasswordController.text,
        'password_confirmation': _confirmPasswordController.text,
      };

      unawaited(context.read<UserProfileCubit>().updateProfile(data));
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(context.l10n.editPassword),
      centerTitle: true,
      leading: const CustomBackButton(),
    ),
    body: BlocConsumer<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        if (state.status == UserProfileStatus.updated) {
          context
            ..showSuccessSnackbar(context.l10n.updatePasswordSuccess)
            ..pop();
        } else if (state.status == UserProfileStatus.failure) {
          context.showErrorSnackbar(
            state.errorMessage ?? context.l10n.errorOccurred,
          );
        }
      },
      builder: (context, state) =>
          BlocSelector<UserProfileCubit, UserProfileState, UserProfileStatus>(
            selector: (state) => state.status,
            builder: (context, status) {
              final isLoading = status == UserProfileStatus.loading;
              return InternetStateManager(
                noInternetScreen: const NoInternetScreen(),
                onRestoreInternetConnection: () {},
                child: AppForm(
                  key: _appFormKey,
                  formKey: _formKey,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: _currentPasswordController,
                        label: context.l10n.currentPassword,
                        isPassword: true,
                        prefixIcon: const Icon(Icons.lock_outline),
                      ),
                      SizedBox(height: 16.h),
                      AppTextFormField(
                        controller: _newPasswordController,
                        label: context.l10n.newPassword,
                        isPassword: true,
                        prefixIcon: const Icon(Icons.lock_outline),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return context.l10n.requiredField;
                          }
                          if (v.length < 6) {
                            return context.l10n.passwordMinLength6;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      AppTextFormField(
                        controller: _confirmPasswordController,
                        label: context.l10n.confirmNewPassword,
                        isPassword: true,
                        prefixIcon: const Icon(Icons.lock_outline),
                        validator: (v) {
                          if (v != _newPasswordController.text) {
                            return context.l10n.passwordsDoNotMatch;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 32.h),
                      AppElevatedButton(
                        onPressed: _submit,
                        isLoading: isLoading,
                        text: context.l10n.saveChanges,
                        width: double.infinity,
                        height: 50.h,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
    ),
  );
}
