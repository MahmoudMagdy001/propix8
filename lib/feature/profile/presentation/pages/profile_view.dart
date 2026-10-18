import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/core/widgets/app_confirmation_dialog.dart';
import 'package:propix8/feature/auth/domain/entities/user_entity.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_bloc.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_state.dart';
import 'package:propix8/feature/profile/presentation/widgets/profile_menu_item.dart';
import 'package:propix8/feature/profile/presentation/widgets/profile_sliver_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) => const _ProfileViewContent();
}

class _ProfileViewContent extends StatelessWidget {
  const _ProfileViewContent();

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colors.surface,
    body: BlocListener<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (state.status == UserProfileStatus.accountDeleted) {
          context.goNamed(AppRoutes.login);
        } else if (state.status == UserProfileStatus.failure) {
          context.showErrorSnackbar(state.errorMessage ?? context.l10n.error);
        }
      },
      child:
          BlocSelector<
            UserProfileBloc,
            UserProfileState,
            ({
              UserProfileStatus status,
              User? user,
              int propertyBookingCount,
              int serviceBookingCount,
            })
          >(
            selector: (state) => (
              status: state.status,
              user: state.user,
              propertyBookingCount: state.propertyBookingCount,
              serviceBookingCount: state.serviceBookingCount,
            ),
            builder: (context, result) {
              final menuGroups = _getMenuGroups(
                context,
                propertyBookingCount: result.propertyBookingCount,
                serviceBookingCount: result.serviceBookingCount,
              );
              return CustomScrollView(
                slivers: [
                  const ProfileSliverAppBar(),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.h,
                      horizontal: 6.w,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final groupData = menuGroups[index];
                        final groupTitle = groupData['groupTitle'] as String?;
                        final items =
                            groupData['items'] as List<Map<String, dynamic>>;

                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.theme.cardTheme.color,
                              borderRadius: context.radius.mdBorder,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (groupTitle != null) ...[
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                      start: 12.w,
                                      end: 12.w,
                                      top: 12.h,
                                    ),
                                    child: Text(
                                      groupTitle,
                                      style: context.typography.titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                                for (int i = 0; i < items.length; i++) ...[
                                  ProfileMenuItem(
                                    title: items[i]['title'] as String,
                                    icon: items[i]['icon'] as IconData,
                                    isDestructive:
                                        items[i]['isDestructive'] as bool? ??
                                        false,
                                    badgeCount: items[i]['badgeCount'] as int?,
                                    onTap: items[i]['onTap'] as VoidCallback,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      }, childCount: menuGroups.length),
                    ),
                  ),
                ],
              );
            },
          ),
    ),
  );

  List<Map<String, dynamic>> _getMenuGroups(
    BuildContext context, {
    required int propertyBookingCount,
    required int serviceBookingCount,
  }) => [
    // Group 1: Bookings and Services
    {
      'groupTitle': context.l10n.profileGroupBookings,
      'items': [
        {
          'title': context.l10n.propertyBookings,
          'icon': Icons.calendar_month_outlined,
          'badgeCount': propertyBookingCount,
          'onTap': () => context.pushNamed(AppRoutes.bookings),
        },
        {
          'title': context.l10n.serviceBookings,
          'icon': Icons.assignment_outlined,
          'badgeCount': serviceBookingCount,
          'onTap': () => context.pushNamed(AppRoutes.maintenanceBooking),
        },
      ],
    },
    // Group 2: Developers and Compounds
    {
      'groupTitle': context.l10n.profileGroupDiscover,
      'items': [
        {
          'title': context.l10n.developers,
          'icon': Icons.business_outlined,
          'onTap': () => context.pushNamed(AppRoutes.developers),
        },
        {
          'title': context.l10n.compounds,
          'icon': Icons.location_city_outlined,
          'onTap': () => context.pushNamed(AppRoutes.compounds),
        },
      ],
    },
    // Group 3: Services, Terms, Privacy, About
    {
      'groupTitle': context.l10n.profileGroupGeneral,
      'items': [
        {
          'title': context.l10n.ourServices,
          'icon': Icons.business_center_outlined,
          'onTap': () => context.pushNamed(AppRoutes.ourServices),
        },
        {
          'title': context.l10n.termsAndConditions,
          'icon': Icons.description_outlined,
          'onTap': () => context.pushNamed(AppRoutes.terms),
        },
        {
          'title': context.l10n.privacyPolicy,
          'icon': Icons.privacy_tip_outlined,
          'onTap': () => context.pushNamed(AppRoutes.privacy),
        },
        {
          'title': context.l10n.aboutUs,
          'icon': Icons.info_outline,
          'onTap': () => context.pushNamed(AppRoutes.aboutUs),
        },
        {
          'title': context.l10n.testimonials,
          'icon': Icons.format_quote_outlined,
          'onTap': () => context.pushNamed(AppRoutes.myTestimonials),
        },
      ],
    },
    // Group 4: Edit Account and Settings
    {
      'groupTitle': context.l10n.profileGroupSettings,
      'items': [
        {
          'title': context.l10n.editProfile,
          'icon': Icons.person_outline,
          'onTap': () => context.pushNamed(AppRoutes.editAccount),
        },
        {
          'title': context.l10n.settings,
          'icon': Icons.settings_outlined,
          'onTap': () => context.pushNamed(AppRoutes.settings),
        },
      ],
    },
    // Group 5: Logout
    {
      'groupTitle': null,
      'items': [
        {
          'title': context.l10n.logout,
          'icon': Icons.logout,
          'isDestructive': true,
          'onTap': () async {
            await showAppConfirmationDialog(
              context,
              title: context.l10n.logout,
              message: context.l10n.logoutConfirmationMessage,
              confirmText: context.l10n.logout,
              actionType: DialogActionType.destructive,
              onConfirm: () async {
                await context.read<AuthBloc>().logout();
                if (context.mounted) {
                  context.goNamed(AppRoutes.login);
                }
              },
            );
          },
        },
      ],
    },
  ];
}
