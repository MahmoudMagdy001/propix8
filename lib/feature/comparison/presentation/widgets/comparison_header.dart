import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';

/// Header widget showing both unit images and titles side-by-side.
class ComparisonHeader extends StatelessWidget {
  const ComparisonHeader({
    required this.baseUnit,
    required this.selectedUnit,
    super.key,
  });

  final UnitDetailsEntity baseUnit;
  final UnitDetailsEntity selectedUnit;

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
    UnitDetailsEntity unit,
    bool isBase,
  ) => Expanded(
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: AspectRatio(
            aspectRatio: 16 / 10,
            child: CachedNetworkImage(
              imageUrl: unit.mainImage,
              fit: BoxFit.cover,
              placeholder: (context, url) => ColoredBox(
                color: context.colorScheme.surfaceContainerHighest,
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => ColoredBox(
                color: context.colorScheme.surfaceContainerHighest,
                child: Icon(
                  Icons.image_not_supported_outlined,
                  size: 32.sp,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          unit.title,
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: isBase
                ? context.colorScheme.primaryContainer
                : context.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Text(
            isBase ? 'الوحدة الأساسية' : 'الوحدة المقارنة',
            style: context.textTheme.labelSmall?.copyWith(
              color: isBase
                  ? context.colorScheme.onPrimaryContainer
                  : context.colorScheme.onSecondaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
