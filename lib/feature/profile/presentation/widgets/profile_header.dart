import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, this.user});

  final User? user;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SizedBox(height: 20.h),
      CircleAvatar(
        radius: 50.r,
        backgroundImage: user?.avatar != null
            ? CachedNetworkImageProvider(user!.avatar!)
            : null,
        child: user?.avatar == null
            ? Icon(Icons.person, size: 50.r, color: context.colors.onSurfaceVariant)
            : null,
      ),
      SizedBox(height: 16.h),
      Text(
        user?.name ?? context.l10n.guestUser,
        style: context.typography.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8.h),
      Text(
        user?.email ?? context.l10n.guestEmail,
        style: context.typography.bodyMedium?.copyWith(
          color: context.colors.onSurfaceVariant,
        ),
      ),
      SizedBox(height: 20.h),
    ],
  );
}
