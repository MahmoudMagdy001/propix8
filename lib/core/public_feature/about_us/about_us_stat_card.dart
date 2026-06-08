import 'package:flutter/material.dart';
import 'package:propix8/core/models/stat_model.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';

class AboutUsStatCard extends StatelessWidget {
  const AboutUsStatCard({required this.stat, super.key});
  final StatModel? stat;

  IconData _getIcon(String? iconName) {
    switch (iconName) {
      case 'location-icon':
        return Icons.location_on_outlined;
      case 'clients-icon':
        return Icons.people_outline;
      case 'sold-icon':
        return Icons.sell_outlined;
      case 'projects-icon':
        return Icons.business_outlined;
      default:
        return Icons.bar_chart_outlined;
    }
  }

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    decoration: BoxDecoration(
      color: context.theme.cardTheme.color,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .04),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              _getIcon(stat?.icon),
              color: context.colorScheme.primary,
              size: 20.r,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                stat?.value ?? '0+',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          stat?.label ?? 'Label',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
