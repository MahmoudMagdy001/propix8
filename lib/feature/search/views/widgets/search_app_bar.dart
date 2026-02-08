import 'package:flutter/material.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/custom_back_button.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) => SliverAppBar(
    elevation: 0,
    leading: const CustomBackButton(),
    title: Text(
      context.l10n.search_title, // Search
    ),
    centerTitle: true,
  );
}
