import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_state_manager/internet_state_manager.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_modal_sheet.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../auth/viewmodels/auth_cubit.dart';
import '../viewmodels/user_profile_cubit.dart';
import '../viewmodels/user_profile_state.dart';

class EditAccountView extends StatelessWidget {
  const EditAccountView({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocListener<UserProfileCubit, UserProfileState>(
        listener: (context, state) {
          if (state.status == UserProfileStatus.accountDeleted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.l10n.accountDeletedSuccess)),
            );
            // Logout to clear token and trigger router redirect
            locator<AuthCubit>().logout();
          } else if (state.status == UserProfileStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? context.l10n.errorOccurred),
                backgroundColor: context.colorScheme.error,
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: Text(context.l10n.editAccount),
          ),
          body: InternetStateManager(
            noInternetScreen: const NoInternetScreen(),
            onRestoreInternetConnection: () {},
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 20.h),
              children: [
                _buildOptionItem(
                  context,
                  title: context.l10n.editData,
                  icon: Icons.person_outline_rounded,
                  onTap: () => context.pushNamed(AppRoutes.editProfileData),
                ),
                _buildOptionItem(
                  context,
                  title: context.l10n.editPassword,
                  icon: Icons.lock_outline_rounded,
                  onTap: () => context.pushNamed(AppRoutes.changePassword),
                ),

                _buildOptionItem(
                  context,
                  title: context.l10n.deleteAccount,
                  icon: Icons.delete_outline_rounded,
                  isDestructive: true,
                  onTap: () => _showDeleteAccountConfirmation(context),
                ),
              ],
            ),
          ),
        ),
      );

  void _showDeleteAccountConfirmation(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();
    showAppModalSheet(
      context: context,
      title: context.l10n.deleteAccount,
      isScrollable: false,
      child: BlocProvider.value(
        value: cubit,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: context.colorScheme.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.warning_rounded,
                  color: context.colorScheme.error,
                  size: 48.sp,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                context.l10n.deleteAccountConfirmationMessage,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Text(
                context.l10n.deleteAccountWarning,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              BlocSelector<
                UserProfileCubit,
                UserProfileState,
                UserProfileStatus
              >(
                selector: (state) => state.status,
                builder: (context, status) {
                  final isLoading = status == UserProfileStatus.loading;
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  context.pop(); // Close modal
                                  context
                                      .read<UserProfileCubit>()
                                      .deleteProfile();
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.colorScheme.error,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: isLoading
                              ? SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : Text(
                                  context.l10n.confirmDeleteAccount,
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: isLoading ? null : () => context.pop(),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            context.l10n.cancel,
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) => Container(
    margin: EdgeInsets.only(bottom: 12.h),
    decoration: BoxDecoration(
      color: context.theme.cardTheme.color,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            children: [
              Icon(
                icon,
                color: isDestructive ? context.colorScheme.error : null,
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  title,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: isDestructive ? context.colorScheme.error : null,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.r,
                color: isDestructive ? context.colorScheme.error : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
