import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_view_switcher.dart';
import '../../viewmodels/search_cubit.dart';
import '../../viewmodels/search_state.dart';

class SearchViewSwitcher extends StatelessWidget {
  const SearchViewSwitcher({super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.l10n.search_results, // Search Results
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocSelector<SearchCubit, SearchState, ViewType>(
            selector: (state) => state.viewType,
            builder: (context, viewType) => AppViewSwitcher(
              viewType: viewType,
              onToggle: () => context.read<SearchCubit>().toggleViewType(),
            ),
          ),
        ],
      ),
    ),
  );
}
