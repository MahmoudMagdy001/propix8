import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_state_manager/internet_state_manager.dart';

import '../../../../core/utils/responsive_helper.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/widgets/custom_back_button.dart';
import '../viewmodels/user_profile_cubit.dart';
import '../viewmodels/user_profile_state.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final data = {
        'current_password': _currentPasswordController.text,
        'password': _newPasswordController.text,
        'password_confirmation': _confirmPasswordController.text,
      };

      context.read<UserProfileCubit>().updateProfile(data);
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.updatePasswordSuccess)),
          );
          context.pop();
        } else if (state.status == UserProfileStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? context.l10n.errorOccurred),
            ),
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
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                    vertical: 10.h,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildPasswordField(
                          controller: _currentPasswordController,
                          label: context.l10n.currentPassword,
                          obscureText: _obscureCurrent,
                          onToggleVisibility: () {
                            setState(() {
                              _obscureCurrent = !_obscureCurrent;
                            });
                          },
                        ),
                        SizedBox(height: 16.h),
                        _buildPasswordField(
                          controller: _newPasswordController,
                          label: context.l10n.newPassword,
                          obscureText: _obscureNew,
                          onToggleVisibility: () {
                            setState(() {
                              _obscureNew = !_obscureNew;
                            });
                          },
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
                        _buildPasswordField(
                          controller: _confirmPasswordController,
                          label: context.l10n.confirmNewPassword,
                          obscureText: _obscureConfirm,
                          onToggleVisibility: () {
                            setState(() {
                              _obscureConfirm = !_obscureConfirm;
                            });
                          },
                          validator: (v) {
                            if (v != _newPasswordController.text) {
                              return context.l10n.passwordsDoNotMatch;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 32.h),
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : _submit,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: isLoading
                                ? const CircularProgressIndicator.adaptive()
                                : Text(context.l10n.saveChanges),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
    ),
  );

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
  }) => TextFormField(
    controller: controller,
    obscureText: obscureText,
    validator: validator,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: IconButton(
        icon: Icon(
          obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
        onPressed: onToggleVisibility,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  );
}
