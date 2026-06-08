import 'package:flutter/material.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';

class AboutUsSectionTitle extends StatelessWidget {
  const AboutUsSectionTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: 4.w,
        height: 24.h,
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
      SizedBox(width: 8.w),
      Text(
        title,
        style: context.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: context.colorScheme.onSurface,
        ),
      ),
    ],
  );
}
