import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_grid.dart';
import 'package:propix8/core/widgets/unit_grid_card.dart';
import 'package:propix8/feature/home/models/unit_model.dart';
import 'package:propix8/feature/home/viewmodels/home_cubit.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';

class HomeAllSection extends StatelessWidget {
  const HomeAllSection({super.key});

  @override
  Widget build(BuildContext context) => MultiSliver(
    children: [
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.allProperties,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      BlocSelector<
        HomeCubit,
        HomeState,
        ({
          HomeRequestStatus status,
          List<UnitModel> allUnits,
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
          final units = isLoading ? UnitModel.dummyUnits : allUnits;

          return AppSliverGrid<UnitModel>(
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
                      color: Theme.of(context).disabledColor,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      context.l10n.noPropertiesFound,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).disabledColor,
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

class MultiSliver extends StatelessWidget {
  const MultiSliver({required this.children, super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => SliverMainAxisGroup(slivers: children);
}
