import 'package:flutter/material.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
    this.isDestructive = false,
    this.badgeCount,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isDestructive;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24.r,
              color: isDestructive ? context.colorScheme.error : null,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: isDestructive ? context.colorScheme.error : null,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (badgeCount != null && badgeCount! > 0) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  badgeCount.toString(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
            ],
            Icon(
              Icons.arrow_forward_ios,
              size: 16.r,
              color: isDestructive
                  ? context.colorScheme.error.withValues(alpha: 0.8)
                  : context.colorScheme.onSurface.withValues(alpha: 0.8),
            ),
          ],
        ),
      ),
    ),
  );
}
