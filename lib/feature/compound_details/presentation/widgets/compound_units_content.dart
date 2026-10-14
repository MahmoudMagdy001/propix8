import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_grid.dart';
import 'package:propix8/core/widgets/app_sliver_list.dart';
import 'package:propix8/core/widgets/unit_grid_card.dart';
import 'package:propix8/core/widgets/unit_list_card.dart';
import 'package:propix8/feature/compound_details/presentation/bloc/compound_units_bloc.dart';
import 'package:propix8/feature/compound_details/presentation/bloc/compound_units_state.dart';
import 'package:propix8/feature/compound_details/presentation/widgets/compound_units_empty.dart';
import 'package:propix8/feature/compound_details/presentation/widgets/compound_units_error.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';

class CompoundUnitsContent extends StatelessWidget {
  const CompoundUnitsContent({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        CompoundUnitsBloc,
        CompoundUnitsState,
        ({HomeRequestStatus status, ViewType viewType, List<UnitEntity> units})
      >(
        selector: (state) => (
          status: state.status,
          viewType: state.viewType,
          units: state.compound?.units ?? const [],
        ),
        builder: (context, data) {
          final status = data.status;
          final viewType = data.viewType;
          final units = data.units;
          final isLoading = status == HomeRequestStatus.loading;

          if (viewType == ViewType.grid) {
            return AppSliverGrid<UnitEntity>(
              items: isLoading ? UnitEntity.dummyUnits : units,
              isLoading: isLoading,
              errorWidget: const CompoundUnitsError(),
              emptyWidget: const CompoundUnitsEmpty(),
              itemBuilder: (context, unit) => UnitGridCard(unit: unit),
            );
          }

          return AppSliverList<UnitEntity>(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            items: isLoading ? UnitEntity.dummyUnits : units,
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
