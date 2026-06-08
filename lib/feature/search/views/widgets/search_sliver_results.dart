import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_grid.dart';
import 'package:propix8/core/widgets/app_sliver_list.dart';
import 'package:propix8/core/widgets/unit_grid_card.dart';
import 'package:propix8/core/widgets/unit_list_card.dart';
import 'package:propix8/feature/home/models/unit_model.dart';
import 'package:propix8/feature/search/viewmodels/search_cubit.dart';
import 'package:propix8/feature/search/viewmodels/search_state.dart';

class SearchSliverResults extends StatelessWidget {
  const SearchSliverResults({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        SearchCubit,
        SearchState,
        ({List<UnitModel> results, ViewType viewType})
      >(
        selector: (state) => (results: state.results, viewType: state.viewType),
        builder: (context, result) {
          if (result.results.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }

          if (result.viewType == ViewType.grid) {
            return AppSliverGrid<UnitModel>(
              items: result.results,
              itemBuilder: (context, item) => UnitGridCard(unit: item),
            );
          }

          return AppSliverList<UnitModel>(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            items: result.results,
            itemBuilder: (context, unit) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: UnitListCard(unit: unit),
            ),
          );
        },
      );
}
