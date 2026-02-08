import 'package:flutter/material.dart';

import '../../../../core/utils/context_extensions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) => SliverAppBar(
    floating: true,
    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: context.theme.scaffoldBackgroundColor,
    title: Text(
      context.l10n.startExploring,
      style: context.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: context.colorScheme.primary,
      ),
    ),
    centerTitle: false,
    // actions: [
    //   Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 16.w),
    //     child: Container(
    //       padding: EdgeInsets.all(8.w),
    //       decoration: BoxDecoration(
    //         color: context.colorScheme.surfaceContainerHighest.withValues(
    //           alpha: 0.5,
    //         ),
    //         shape: BoxShape.circle,
    //       ),
    //       child: Icon(
    //         Icons.notifications_none_rounded,
    //         size: 28.w,
    //         color: context.colorScheme.primary,
    //       ),
    //     ),
    //   ),
    // ],
  );
}
