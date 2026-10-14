import 'package:flutter/material.dart';
import 'package:propix8/core/utils/context_extensions.dart';

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
  );
}
