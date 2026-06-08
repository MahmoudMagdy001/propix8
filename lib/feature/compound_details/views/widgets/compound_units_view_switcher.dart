import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_view_switcher.dart';
import 'package:propix8/feature/compound_details/viewmodels/compound_units_cubit.dart';
import 'package:propix8/feature/compound_details/viewmodels/compound_units_state.dart';

class CompoundUnitsViewSwitcher extends StatelessWidget {
  const CompoundUnitsViewSwitcher({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<CompoundUnitsCubit, CompoundUnitsState, ViewType>(
        selector: (state) => state.viewType,
        builder: (context, viewType) => SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppViewSwitcher(
                  viewType: viewType,
                  onToggle: () =>
                      context.read<CompoundUnitsCubit>().toggleViewType(),
                ),
              ],
            ),
          ),
        ),
      );
}
