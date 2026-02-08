import 'package:flutter/material.dart';

import '../../../../../../core/utils/context_extensions.dart';
import '../../../../../../core/utils/responsive_helper.dart';

enum _CounterAction { none, increment, decrement }

class FilterCounter extends StatefulWidget {
  const FilterCounter({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
  });
  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  State<FilterCounter> createState() => _FilterCounterState();
}

class _FilterCounterState extends State<FilterCounter> {
  _CounterAction _activeAction = _CounterAction.none;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(vertical: 8.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.label, style: context.textTheme.bodyLarge?.copyWith()),
        Row(
          children: [
            _buildButton(
              icon: Icons.remove,
              onPressed: () {
                if (widget.value > 0) {
                  widget.onChanged(widget.value - 1);
                  setState(() => _activeAction = _CounterAction.decrement);
                }
              },
              isActive: _activeAction == _CounterAction.decrement,
              enabled: widget.value > 0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                '${widget.value}',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildButton(
              icon: Icons.add,
              onPressed: () {
                widget.onChanged(widget.value + 1);
                setState(() => _activeAction = _CounterAction.increment);
              },
              isActive: _activeAction == _CounterAction.increment,
            ),
          ],
        ),
      ],
    ),
  );

  Widget _buildButton({
    required IconData icon,
    required VoidCallback onPressed,
    required bool isActive,
    bool enabled = true,
  }) {
    final Color backgroundColor;
    final Color iconColor;

    if (!enabled) {
      backgroundColor = context.colorScheme.onSurface.withValues(alpha: 0.12);
      iconColor = context.colorScheme.onSurface.withValues(alpha: 0.38);
    } else {
      backgroundColor = isActive
          ? context.colorScheme.primary
          : context.colorScheme.secondary.withValues(alpha: 0.3);
      iconColor = Colors.white;
    }

    return InkWell(
      onTap: enabled ? onPressed : null,
      borderRadius: BorderRadius.circular(8.r),
      child: AnimatedScale(
        scale: (enabled && isActive) ? 1.0 : 0.95,
        duration: enabled ? const Duration(milliseconds: 150) : Duration.zero,
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: enabled ? const Duration(milliseconds: 150) : Duration.zero,
          curve: Curves.easeOut,
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, size: 20.r, color: iconColor),
        ),
      ),
    );
  }
}
