import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_bloc.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_state.dart';

class ProfileSliverAppBar extends StatelessWidget {
  const ProfileSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<UserProfileBloc, UserProfileState, User?>(
        selector: (state) => state.user,
        builder: (context, user) => SliverAppBar(
          expandedHeight: 180.h,
          pinned: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: context.colors.surface,
          centerTitle: true,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final top = constraints.biggest.height;
              final statusBarHeight = MediaQuery.of(context).padding.top;
              final collapsedHeight = kToolbarHeight + statusBarHeight;
              final isCollapsed = top <= collapsedHeight + 5.h;

              return FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.zero,
                expandedTitleScale: 1.0,
                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isCollapsed ? 1.0 : 0.0,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: _buildAvatar(context, user?.avatar, 38.w),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          user?.name ?? context.l10n.guestUser,
                          style: context.typography.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.colors.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                background: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isCollapsed ? 0.0 : 1.0,
                  curve: Curves.easeInOut,
                  child: Padding(
                    padding: EdgeInsets.only(top: statusBarHeight + 10.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 90.w,
                          height: 90.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10.r,
                                offset: Offset(0, 4.h),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: _buildAvatar(context, user?.avatar, 90.w),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          user?.name ?? context.l10n.guestUser,
                          style: context.typography.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.colors.onSurface,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        if (user?.email != null) ...[
                          SizedBox(height: 4.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Text(
                              user!.email!,
                              style: context.typography.bodyMedium?.copyWith(
                                color: context.colors.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );

  Widget _buildAvatar(BuildContext context, String? avatarUrl, double size) {
    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: avatarUrl,
        fit: BoxFit.cover,
        width: size,
        height: size,
        placeholder: (context, url) => ColoredBox(
          color: context.colors.surfaceContainerHighest,
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        errorWidget: (context, url, error) => _buildFallback(context, size),
      );
    }
    return _buildFallback(context, size);
  }

  Widget _buildFallback(BuildContext context, double size) => Container(
    width: size,
    height: size,
    color: context.colors.primary.withValues(alpha: 0.1),
    child: Icon(
      Icons.person,
      size: size * 0.6,
      color: context.colors.primary,
    ),
  );
}
