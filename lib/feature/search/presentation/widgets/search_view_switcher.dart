import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_view_switcher.dart';
import 'package:propix8/feature/search/presentation/bloc/search_bloc.dart';
import 'package:propix8/feature/search/presentation/bloc/search_event.dart';
import 'package:propix8/feature/search/presentation/bloc/search_state.dart';

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
            context.l10n.search_results,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocSelector<SearchBloc, SearchState, ViewType>(
            selector: (state) => state.viewType,
            builder: (context, viewType) => AppViewSwitcher(
              viewType: viewType,
              onToggle: () => context.read<SearchBloc>().add(
                    const SearchEvent.viewTypeToggled(),
                  ),
            ),
          ),
        ],
      ),
    ),
  );
}
