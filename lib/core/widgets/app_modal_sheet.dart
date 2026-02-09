import 'package:flutter/material.dart';

import '../utils/context_extensions.dart';
import '../utils/responsive_helper.dart';

Future<T?> showAppModalSheet<T>({
  required BuildContext context,
  required Widget child,
  String? title,
  Widget? action,
  bool isScrollable = true,
  double? maxHeight,
}) => showModalBottomSheet<T>(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (context) => AppModalSheetLayout(
    title: title,
    action: action,
    isScrollable: isScrollable,
    maxHeight: maxHeight,
    child: child,
  ),
);

class AppModalSheetLayout extends StatelessWidget {
  const AppModalSheetLayout({
    required this.child,
    super.key,
    this.title,
    this.action,
    this.isScrollable = true,
    this.maxHeight,
  });
  final Widget child;
  final String? title;
  final Widget? action;
  final bool isScrollable;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: context.theme.cardTheme.color,

      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    constraints: BoxConstraints(maxHeight: maxHeight ?? 0.8.sh),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8.h),
        Container(
          width: 40.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        if (title != null || action != null) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const Spacer(),
                if (action != null) action! else SizedBox(width: 32.r),
              ],
            ),
          ),
          Divider(height: 1.h, color: Colors.grey[200]),
          SizedBox(height: 16.h),
        ],
        if (isScrollable)
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
              ),
              child: child,
            ),
          )
        else
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
            ),
            child: child,
          ),
      ],
    ),
  );
}
