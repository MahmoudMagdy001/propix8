import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:propix8/core/theme/app_colors.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    super.key,
  });
  final String title;
  final String subtitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      // Background Image for this page
      Positioned.fill(
        child: CachedNetworkImage(
          imageUrl: imagePath,
          memCacheHeight: 1080,
          memCacheWidth: 1920,

          fit: BoxFit.cover,
          errorWidget: (context, url, error) =>
              Container(color: AppColors.primaryLight),
        ),
      ),
      // Overlay for readability
      Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withAlpha(51),
                Colors.transparent,
                Colors.black.withAlpha(127),
              ],
            ),
          ),
        ),
      ),
      Column(
        children: [
          const Spacer(),
          // Content Card
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            decoration: BoxDecoration(
              color: context.theme.cardTheme.color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
