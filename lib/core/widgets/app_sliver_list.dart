import 'package:flutter/material.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppSliverList<T> extends StatelessWidget {
  const AppSliverList({
    required this.items,
    required this.itemBuilder,
    super.key,
    this.isLoading = false,
    this.errorMessage,
    this.padding,
    this.emptyWidget,
    this.errorWidget,
    this.separatorBuilder,
  });

  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final bool isLoading;
  final String? errorMessage;
  final EdgeInsetsGeometry? padding;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final IndexedWidgetBuilder? separatorBuilder;

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null && items.isEmpty) {
      return errorWidget ??
          SliverFillRemaining(
            hasScrollBody: false,
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
          SliverFillRemaining(
            hasScrollBody: false,
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

    final list = separatorBuilder != null
        ? SliverList.separated(
            itemCount: items.length,
            separatorBuilder: separatorBuilder!,
            itemBuilder: (context, index) => itemBuilder(context, items[index]),
          )
        : SliverList.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => itemBuilder(context, items[index]),
          );

    return Skeletonizer.sliver(
      enabled: isLoading,
      child: padding != null
          ? SliverPadding(padding: padding!, sliver: list)
          : list,
    );
  }
}
