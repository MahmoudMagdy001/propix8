import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../auth/models/auth_model.dart';
import '../../viewmodels/user_profile_cubit.dart';
import '../../viewmodels/user_profile_state.dart';

class ProfileSliverAppBar extends StatelessWidget {
  const ProfileSliverAppBar({super.key});

  @override
  Widget build(
    BuildContext context,
  ) => BlocSelector<UserProfileCubit, UserProfileState, User?>(
    selector: (state) => state.user,
    builder: (context, user) => SliverAppBar(
      expandedHeight: 180.h,
      pinned: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: context.colorScheme.surface,
      centerTitle: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final top = constraints.biggest.height;
          final statusBarHeight = MediaQuery.of(context).padding.top;
          final collapsedHeight = kToolbarHeight + statusBarHeight;
          // Use a small threshold to detect collapse state
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
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(child: _buildAvatar(user?.avatar, 38.w)),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      user?.name ?? context.l10n.guestUser,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurface,
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
                      child: ClipOval(child: _buildAvatar(user?.avatar, 90.w)),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      user?.name ?? context.l10n.guestUser,
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (user?.email != null) ...[
                      SizedBox(height: 4.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: context.colorScheme.primary,
                              size: 14.w,
                            ),
                            SizedBox(width: 4.w),
                            Flexible(
                              child: Text(
                                user!.email!,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.labelMedium?.copyWith(
                                  color: context.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ],
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

  Widget _buildAvatar(String? url, double size) {
    if (url != null && url.isNotEmpty) {
      return CachedNetworkImage(
        memCacheHeight: (size * 3).toInt(), // Optimize memory usage
        imageUrl: url,
        fit: BoxFit.cover,
        width: size,
        height: size,
        errorWidget: (context, url, error) => _buildPlaceholder(size),
      );
    }
    return _buildPlaceholder(size);
  }

  Widget _buildPlaceholder(double size) => Container(
    width: size,
    height: size,
    color: Colors.grey.shade100, // Light background for placeholder
    child: Icon(Icons.person, size: size * 0.5),
  );
}
