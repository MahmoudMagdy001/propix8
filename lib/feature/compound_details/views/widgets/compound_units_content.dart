import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_sliver_grid.dart';
import '../../../../core/widgets/app_sliver_list.dart';
import '../../../../core/widgets/unit_grid_card.dart';
import '../../../../core/widgets/unit_list_card.dart';
import '../../../home/models/unit_model.dart';
import '../../../home/viewmodels/home_state.dart';
import '../../viewmodels/compound_units_cubit.dart';
import '../../viewmodels/compound_units_state.dart';
import 'compound_units_empty.dart';
import 'compound_units_error.dart';

class CompoundUnitsContent extends StatelessWidget {
  const CompoundUnitsContent({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        CompoundUnitsCubit,
        CompoundUnitsState,
        ({HomeRequestStatus status, ViewType viewType, List<UnitModel> units})
      >(
        selector: (state) => (
          status: state.status,
          viewType: state.viewType,
          units: state.compound?.units ?? [],
        ),
        builder: (context, data) {
          final status = data.status;
          final viewType = data.viewType;
          final units = data.units;
          final isLoading = status == HomeRequestStatus.loading;

          if (viewType == ViewType.grid) {
            return AppSliverGrid<UnitModel>(
              items: isLoading ? UnitModel.dummyUnits : units,
              isLoading: isLoading,
              errorWidget: const CompoundUnitsError(),
              emptyWidget: const CompoundUnitsEmpty(),
              itemBuilder: (context, unit) => UnitGridCard(unit: unit),
            );
          }

          return AppSliverList<UnitModel>(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            items: isLoading ? UnitModel.dummyUnits : units,
            isLoading: isLoading,
            errorWidget: const CompoundUnitsError(),
            emptyWidget: const CompoundUnitsEmpty(),
            itemBuilder: (context, unit) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: UnitListCard(unit: unit),
            ),
          );
        },
      );
}
