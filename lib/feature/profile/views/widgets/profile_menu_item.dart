import 'package:flutter/material.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
    this.isDestructive = false,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isDestructive;
  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          children: [
            Icon(icon, size: 24.r, color: isDestructive ? Colors.red : null),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: isDestructive ? Colors.red : null,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.r, color: Colors.grey),
          ],
        ),
      ),
    ),
  );
}
