import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/core/widgets/app_modal_sheet.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_bloc.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_event.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_state.dart';

class EditAccountView extends StatelessWidget {
  const EditAccountView({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocListener<UserProfileBloc, UserProfileState>(
        listener: (context, state) {
          if (state.status == UserProfileStatus.accountDeleted) {
            context.showSuccessSnackbar(context.l10n.accountDeletedSuccess);
            unawaited(locator<AuthBloc>().clearLocalSession());
            context.go(AppRoutes.loginPath);
          } else if (state.status == UserProfileStatus.failure) {
            context.showErrorSnackbar(
              state.errorMessage ?? context.l10n.errorOccurred,
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
    final bloc = context.read<UserProfileBloc>();
    unawaited(
      showAppModalSheet<void>(
        context: context,
        title: context.l10n.deleteAccount,
        isScrollable: false,
        child: BlocProvider.value(
          value: bloc,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: context.colors.error.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.warning_rounded,
                    color: context.colors.error,
                    size: 48.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  context.l10n.deleteAccountConfirmationMessage,
                  style: context.typography.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                Text(
                  context.l10n.deleteAccountWarning,
                  style: context.typography.bodyMedium?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                BlocSelector<
                  UserProfileBloc,
                  UserProfileState,
                  UserProfileStatus
                >(
                  selector: (state) => state.status,
                  builder: (context, status) {
                    final isLoading = status == UserProfileStatus.loading;
                    return Column(
                      children: [
                        AppElevatedButton(
                          onPressed: () {
                            context.pop();
                            bloc.add(
                              const UserProfileEvent.profileDeleted(),
                            );
                          },
                          isLoading: isLoading,
                          backgroundColor: context.colors.error,
                          foregroundColor: Colors.white,
                          text: context.l10n.confirmDeleteAccount,
                          width: double.infinity,
                        ),
                        SizedBox(height: 12.h),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: isLoading ? null : () => context.pop(),
                            child: Text(
                              context.l10n.cancel,
                              style: context.typography.titleMedium?.copyWith(
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
      borderRadius: context.radius.mdBorder,
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
        borderRadius: context.radius.mdBorder,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            children: [
              Icon(
                icon,
                color: isDestructive ? context.colors.error : null,
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  title,
                  style: context.typography.titleMedium?.copyWith(
                    color: isDestructive ? context.colors.error : null,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.r,
                color: isDestructive
                    ? context.colors.error
                    : context.colors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
