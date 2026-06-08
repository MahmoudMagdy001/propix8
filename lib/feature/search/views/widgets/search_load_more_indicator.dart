import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';
import 'package:propix8/feature/search/viewmodels/search_cubit.dart';
import 'package:propix8/feature/search/viewmodels/search_state.dart';

class SearchLoadMoreIndicator extends StatelessWidget {
  const SearchLoadMoreIndicator({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<SearchCubit, SearchState, HomeRequestStatus>(
        selector: (state) => state.loadMoreStatus,
        builder: (context, status) {
          if (status == HomeRequestStatus.loading) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: const Center(child: CircularProgressIndicator()),
              ),
            );
          }
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        },
      );
}
