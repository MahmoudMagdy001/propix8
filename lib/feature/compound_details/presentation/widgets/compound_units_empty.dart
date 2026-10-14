import 'package:flutter/material.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';

class CompoundUnitsEmpty extends StatelessWidget {
  const CompoundUnitsEmpty({super.key});

  @override
  Widget build(BuildContext context) => SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off_rounded,
                size: 64.w,
                color: context.colors.outline,
              ),
              SizedBox(height: 16.h),
              Text(
                context.l10n.no_results,
                style: context.typography.titleMedium?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
}
