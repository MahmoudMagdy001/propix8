import 'package:flutter/material.dart';

import '../utils/context_extensions.dart';
import '../utils/responsive_helper.dart';

class AppSegmentedToggle<T> extends StatelessWidget {
  const AppSegmentedToggle({
    required this.values,
    required this.onChanged,
    required this.labelBuilder,
    this.activeValue,
    this.backgroundColor,
    super.key,
  });

  final List<T> values;
  final T? activeValue;
  final ValueChanged<T?> onChanged;
  final String Function(T value) labelBuilder;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    decoration: BoxDecoration(
      color:
          backgroundColor ??
          context.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(12.r),
    ),
    padding: EdgeInsets.all(4.w),
    child: Row(
      children: values.map((value) {
        final isFirst = values.indexOf(value) == 0;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: isFirst ? 6.w : 0.w),
            child: _ToggleItem<T>(
              label: labelBuilder(value),
              isActive: value == activeValue,
              onTap: () {
                if (activeValue == value) {
                  onChanged(null);
                } else {
                  onChanged(value);
                }
              },
            ),
          ),
        );
      }).toList(),
    ),
  );
}

class _ToggleItem<T> extends StatelessWidget {
  const _ToggleItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: isActive ? context.colorScheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
      ),
      alignment: Alignment.center,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        style: (context.textTheme.labelLarge ?? const TextStyle()).copyWith(
          color: isActive
              ? context.colorScheme.onPrimary
              : context.colorScheme.onSurfaceVariant,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
        child: Text(label),
      ),
    ),
  );
}
