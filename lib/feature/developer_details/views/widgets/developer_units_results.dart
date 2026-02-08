import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_sliver_grid.dart';
import '../../../../core/widgets/app_sliver_list.dart';
import '../../../../core/widgets/unit_grid_card.dart';
import '../../../../core/widgets/unit_list_card.dart';
import '../../../home/models/unit_model.dart';
import '../../../home/viewmodels/home_state.dart';
import '../../viewmodels/developer_units_cubit.dart';
import '../../viewmodels/developer_units_state.dart';

class DeveloperUnitsResults extends StatelessWidget {
  const DeveloperUnitsResults({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        DeveloperUnitsCubit,
        DeveloperUnitsState,
        ({HomeRequestStatus status, ViewType viewType, List<UnitModel> units})
      >(
        selector: (state) => (
          status: state.status,
          viewType: state.viewType,
          units: state.developer?.units ?? [],
        ),
        builder: (context, data) {
          final status = data.status;
          final viewType = data.viewType;
          final units = data.units;

          if (status == HomeRequestStatus.failure) {
            return SliverFillRemaining(
              child: Center(
                child:
                    BlocSelector<
                      DeveloperUnitsCubit,
                      DeveloperUnitsState,
                      String?
                    >(
                      selector: (state) => state.errorMessage,
                      builder: (context, errorMessage) =>
                          Text(errorMessage ?? context.l10n.error),
                    ),
              ),
            );
          }

          final isLoading = status == HomeRequestStatus.loading;
          final displayUnits = isLoading ? UnitModel.dummyUnits : units;

          if (status == HomeRequestStatus.success && units.isEmpty) {
            return SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      size: 64.w,
                      color: context.colorScheme.outline,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      context.l10n.no_results,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (viewType == ViewType.grid) {
            return AppSliverGrid<UnitModel>(
              items: displayUnits,
              itemBuilder: (context, unit) => UnitGridCard(unit: unit),
            );
          }

          return AppSliverList<UnitModel>(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            items: displayUnits,
            itemBuilder: (context, unit) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: UnitListCard(unit: unit),
            ),
          );
        },
      );
}
