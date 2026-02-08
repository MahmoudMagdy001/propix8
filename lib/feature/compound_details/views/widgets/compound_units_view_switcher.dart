import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_view_switcher.dart';
import '../../viewmodels/compound_units_cubit.dart';
import '../../viewmodels/compound_units_state.dart';

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
