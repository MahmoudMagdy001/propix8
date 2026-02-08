import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../auth/models/auth_model.dart';

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
            ? Icon(Icons.person, size: 50.r, color: Colors.grey)
            : null,
      ),
      SizedBox(height: 16.h),
      Text(
        user?.name ?? context.l10n.guestUser,
        style: context.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8.h),
      Text(
        user?.email ?? context.l10n.guestEmail,
        style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey),
      ),
      SizedBox(height: 20.h),
    ],
  );
}
