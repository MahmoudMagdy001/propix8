import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_view_switcher.dart';
import '../../viewmodels/developer_units_cubit.dart';
import '../../viewmodels/developer_units_state.dart';

class DeveloperUnitsViewSwitcher extends StatelessWidget {
  const DeveloperUnitsViewSwitcher({super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocSelector<DeveloperUnitsCubit, DeveloperUnitsState, ViewType>(
            selector: (state) => state.viewType,
            builder: (context, viewType) => AppViewSwitcher(
              viewType: viewType,
              onToggle: () =>
                  context.read<DeveloperUnitsCubit>().toggleViewType(),
            ),
          ),
        ],
      ),
    ),
  );
}
