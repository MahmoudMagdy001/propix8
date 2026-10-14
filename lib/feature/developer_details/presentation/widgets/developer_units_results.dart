import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_grid.dart';
import 'package:propix8/core/widgets/app_sliver_list.dart';
import 'package:propix8/core/widgets/unit_grid_card.dart';
import 'package:propix8/core/widgets/unit_list_card.dart';
import 'package:propix8/feature/developer_details/presentation/bloc/developer_units_bloc.dart';
import 'package:propix8/feature/developer_details/presentation/bloc/developer_units_state.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';

class DeveloperUnitsResults extends StatelessWidget {
  const DeveloperUnitsResults({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        DeveloperUnitsBloc,
        DeveloperUnitsState,
        ({HomeRequestStatus status, ViewType viewType, List<UnitEntity> units})
      >(
        selector: (state) => (
          status: state.status,
          viewType: state.viewType,
          units: state.developer?.units ?? const [],
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
                      DeveloperUnitsBloc,
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
          final displayUnits = isLoading ? UnitEntity.dummyUnits : units;

          if (status == HomeRequestStatus.success && units.isEmpty) {
            return SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      size: 64.w,
                      color: context.colors.outline,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      context.l10n.no_results,
                      style: context.typography.titleMedium?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (viewType == ViewType.grid) {
            return AppSliverGrid<UnitEntity>(
              items: displayUnits,
              itemBuilder: (context, unit) => UnitGridCard(unit: unit),
            );
          }

          return AppSliverList<UnitEntity>(
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
