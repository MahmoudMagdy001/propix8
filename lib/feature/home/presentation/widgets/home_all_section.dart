import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_grid.dart';
import 'package:propix8/core/widgets/unit_grid_card.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_bloc.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';

class HomeAllSection extends StatelessWidget {
  const HomeAllSection({super.key});

  @override
  Widget build(BuildContext context) => SliverMainAxisGroup(
    slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.allProperties,
                style: context.typography.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      BlocSelector<
        HomeBloc,
        HomeState,
        ({
          HomeRequestStatus status,
          List<UnitEntity> allUnits,
          String? errorMessage,
        })
      >(
        selector: (state) => (
          status: state.allStatus,
          allUnits: state.allUnits,
          errorMessage: state.errorMessage,
        ),
        builder: (context, data) {
          final status = data.status;
          final allUnits = data.allUnits;
          final errorMessage = data.errorMessage;

          final isLoading = status == HomeRequestStatus.loading;
          final units = isLoading ? UnitEntity.dummyUnits : allUnits;

          return AppSliverGrid<UnitEntity>(
            items: units,
            isLoading: isLoading,
            errorMessage: status == HomeRequestStatus.failure
                ? errorMessage
                : null,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            emptyWidget: SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 48.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_work_outlined,
                      size: 64.w,
                      color: context.colors.outline,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      context.l10n.noPropertiesFound,
                      style: context.typography.titleMedium?.copyWith(
                        color: context.colors.outline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemBuilder: (context, unit) => UnitGridCard(unit: unit),
          );
        },
      ),
    ],
  );
}
