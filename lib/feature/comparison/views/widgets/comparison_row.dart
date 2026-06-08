import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/feature/comparison/models/comparison_model.dart';

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
                  // if (item.isDifferent) ...[
                  //   Icon(
                  //     Icons.swap_horiz_rounded,
                  //     size: 14.sp,
                  //     color: context.colorScheme.primary.withValues(alpha: 0.7),
                  //   ),
                  //   SizedBox(width: 4.w),
                  // ],
                  Flexible(
                    child: Text(
                      item.label,
                      textAlign: TextAlign.center,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                      ),
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

  Widget _buildValueText(
    BuildContext context,
    String value,
    Color? textColor,
  ) => Text(
    value,
    textAlign: TextAlign.center,
    style: context.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.bold,
      color: textColor ?? context.colorScheme.onSurface,
    ),
  );

  /// Gets the appropriate color for a value based on the advantage.
  Color? _getColorForValue(
    ColorScheme colorScheme, {
    required bool isFirstValue,
  }) {
    if (item.advantage == ComparisonAdvantage.none) {
      return null; // Default color
    }

    // Green for better value, red for worse value
    if (isFirstValue) {
      return item.advantage == ComparisonAdvantage.first
          ? colorScheme.primary
          : colorScheme.error.withValues(alpha: 0.7);
    } else {
      return item.advantage == ComparisonAdvantage.second
          ? colorScheme.primary
          : colorScheme.error.withValues(alpha: 0.7);
    }
  }
}
