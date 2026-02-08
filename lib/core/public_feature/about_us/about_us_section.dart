import 'package:flutter/material.dart';

import '../../utils/context_extensions.dart';
import '../../utils/responsive_helper.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({
    required this.title,
    required this.content,
    required this.icon,
    super.key,
  });

  final String title;
  final String content;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(18.w),
    decoration: BoxDecoration(
      color: context.theme.cardTheme.color,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .05),
          blurRadius: 20,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: context.colorScheme.primary, size: 24.r),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          content,
          style: context.textTheme.bodyMedium?.copyWith(
            height: 1.8,
            color: context.colorScheme.onSurfaceVariant,
            fontSize: 14.sp,
          ),
        ),
      ],
    ),
  );
}
