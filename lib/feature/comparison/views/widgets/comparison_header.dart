import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/feature/unit_details/models/unit_details_model.dart';

/// Header widget showing both unit images and titles side-by-side.
class ComparisonHeader extends StatelessWidget {
  const ComparisonHeader({
    required this.baseUnit,
    required this.selectedUnit,
    super.key,
  });

  final UnitDetailsModel baseUnit;
  final UnitDetailsModel selectedUnit;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: context.colorScheme.surface,
      boxShadow: [
        BoxShadow(
          color: context.colorScheme.shadow.withValues(alpha: 0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            _buildUnitCard(context, baseUnit, true),
            SizedBox(width: 16.w),
            _buildUnitCard(context, selectedUnit, false),
          ],
        ),
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            shape: BoxShape.circle,
            border: Border.all(color: context.colorScheme.surface, width: 3.w),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.shadow.withValues(alpha: 0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.compare_arrows_rounded,
            size: 20.sp,
            color: context.colorScheme.onPrimary,
          ),
        ),
      ],
    ),
  );

  Widget _buildUnitCard(
    BuildContext context,
    UnitDetailsModel unit,
    bool isBase,
  ) {
    final imageUrl = unit.media.isNotEmpty ? unit.media.first.filePath : null;

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isBase
                ? context.colorScheme.primary.withValues(alpha: 0.2)
                : context.colorScheme.secondary.withValues(alpha: 0.2),
            width: 1.5.w,
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: CachedNetworkImage(
                  memCacheHeight: 100 * 2,
                  imageUrl: imageUrl!,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Icon(
                    Icons.broken_image_outlined,
                    size: 24.sp,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              unit.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
