import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/feature/comparison/domain/entities/comparison_item.dart';

/// A single row in the comparison table showing an attribute's values for both units.
class ComparisonRow extends StatelessWidget {
  const ComparisonRow({required this.item, required this.isEven, super.key});

  final ComparisonItem item;
  final bool isEven;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
    decoration: BoxDecoration(
      color: isEven
          ? context.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1)
          : null,
      border: Border(
        bottom: BorderSide(
          color: context.colorScheme.outlineVariant.withValues(alpha: 0.3),
          width: 0.5.w,
        ),
      ),
    ),
    child: Row(
      children: [
        // Left value (base unit)
        Expanded(
          child: _buildValueText(
            context,
            item.value1,
            _getColorForValue(context.colorScheme, isFirstValue: true),
          ),
        ),
        // Label (center)
        Expanded(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      item.label,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Right value (selected unit)
        Expanded(
          child: _buildValueText(
            context,
            item.value2,
            _getColorForValue(context.colorScheme, isFirstValue: false),
          ),
        ),
      ],
    ),
  );

  Widget _buildValueText(BuildContext context, String value, Color color) =>
      Text(
        value,
        style: context.textTheme.bodyMedium?.copyWith(
          color: color,
          fontWeight: item.advantage != ComparisonAdvantage.none
              ? FontWeight.bold
              : FontWeight.normal,
        ),
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      );

  Color _getColorForValue(
    ColorScheme colorScheme, {
    required bool isFirstValue,
  }) {
    if (item.advantage == ComparisonAdvantage.none) {
      return colorScheme.onSurface;
    }

    final isAdvantaged =
        (isFirstValue && item.advantage == ComparisonAdvantage.first) ||
        (!isFirstValue && item.advantage == ComparisonAdvantage.second);

    return isAdvantaged
        ? Colors.green.shade700
        : colorScheme.onSurface.withValues(alpha: 0.6);
  }
}
