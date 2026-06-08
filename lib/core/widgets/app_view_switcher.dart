import 'package:flutter/material.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/core/utils/responsive_helper.dart';

class AppViewSwitcher extends StatelessWidget {
  const AppViewSwitcher({
    required this.viewType,
    required this.onToggle,
    super.key,
  });

  final ViewType viewType;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) => Container(
    width: 110.w,
    height: 44.h,
    padding: EdgeInsets.all(4.w),
    decoration: BoxDecoration(
      color: context.colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Stack(
      children: [
        // Sliding Background
        AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: viewType == ViewType.list
              ? AlignmentDirectional.centerStart
              : AlignmentDirectional.centerEnd,
          child: Container(
            width: 51.w,
            height: double.infinity,
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4.r,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
        // Icons
        Row(
          children: [
            _ViewIcon(
              icon: Icons.view_list_rounded,
              isActive: viewType == ViewType.list,
              onTap: () {
                if (viewType != ViewType.list) onToggle();
              },
            ),
            _ViewIcon(
              icon: Icons.grid_view_rounded,
              isActive: viewType == ViewType.grid,
              onTap: () {
                if (viewType != ViewType.grid) onToggle();
              },
            ),
          ],
        ),
      ],
    ),
  );
}

class _ViewIcon extends StatelessWidget {
  const _ViewIcon({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Expanded(
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Center(
        child: Icon(
          icon,
          size: 20.w,
          color: isActive
              ? context.colorScheme.primary
              : context.colorScheme.onSurfaceVariant,
        ),
      ),
    ),
  );
}
