import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../utils/context_extensions.dart';
import '../utils/responsive_helper.dart';

typedef ItemBuilder<T> = Widget Function(BuildContext context, T item);

class AppSliverGrid<T> extends StatelessWidget {
  const AppSliverGrid({
    required this.items,
    required this.itemBuilder,
    super.key,
    this.isLoading = false,
    this.errorMessage,
    this.crossAxisCount = 2,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.childAspectRatio = 0.72,
    this.padding,
    this.emptyWidget,
    this.errorWidget,
  });

  final List<T> items;
  final ItemBuilder<T> itemBuilder;
  final bool isLoading;
  final String? errorMessage;
  final int crossAxisCount;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final double childAspectRatio;
  final EdgeInsetsGeometry? padding;
  final Widget? emptyWidget;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return errorWidget ??
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Text(errorMessage ?? context.l10n.error),
              ),
            ),
          );
    }

    if (!isLoading && items.isEmpty) {
      return emptyWidget ??
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 48.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      size: 64.w,
                      color: context.colorScheme.outline,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      context.l10n.noDataFound,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
    }

    return Skeletonizer.sliver(
      enabled: isLoading,
      child: SliverPadding(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 4.w),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: mainAxisSpacing ?? 8.h,
            crossAxisSpacing: crossAxisSpacing ?? 8.w,
            childAspectRatio: childAspectRatio,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => itemBuilder(context, items[index]),
            childCount: items.length,
          ),
        ),
      ),
    );
  }
}
