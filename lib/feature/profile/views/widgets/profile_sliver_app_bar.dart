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
      expandedHeight: 150.h,
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
          final isCollapsed = top <= collapsedHeight + 5;

          return FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.zero,
            title: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isCollapsed ? 1.0 : 0.0,
              child: Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.grey.shade50,
                        // border: Border.all(color: Colors.grey.shade100),
                      ),
                      child: ClipOval(child: _buildAvatar(user?.avatar, 32.w)),
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
              child: Padding(
                padding: EdgeInsets.only(top: statusBarHeight + 10.h),
                child: Column(
                  children: [
                    Container(
                      width: 100.w,
                      height: 100.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipOval(child: _buildAvatar(user?.avatar, 100.w)),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      user?.name ?? context.l10n.guestUser,
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    if (user?.email != null)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: context.colorScheme.primary,
                              size: 16.r,
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
        memCacheHeight: size.toInt() * 3,
        imageUrl: url,
        fit: BoxFit.cover,
        width: size,
        height: size,
        errorWidget: (context, url, error) => const Icon(Icons.broken_image),
      );
    }
    return Icon(Icons.person, color: Colors.grey, size: size * 0.5);
  }
}
