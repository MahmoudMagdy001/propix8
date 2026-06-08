import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_list.dart';
import 'package:propix8/core/widgets/unit_list_card.dart';
import 'package:propix8/feature/home/models/unit_model.dart';
import 'package:propix8/feature/home/viewmodels/home_cubit.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';

class HomeLatestSection extends StatelessWidget {
  const HomeLatestSection({super.key});

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
                context.l10n.latestProperties,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child:
            BlocSelector<
              HomeCubit,
              HomeState,
              ({
                HomeRequestStatus status,
                List<UnitModel> latestUnits,
                String? errorMessage,
              })
            >(
              selector: (state) => (
                status: state.latestStatus,
                latestUnits: state.latestUnits,
                errorMessage: state.errorMessage,
              ),
              builder: (context, data) {
                final status = data.status;
                final latestUnits = data.latestUnits;
                final errorMessage = data.errorMessage;

                final isLoading = status == HomeRequestStatus.loading;

                return SizedBox(
                  height: 255.h,
                  child: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      AppSliverList<UnitModel>(
                        items: isLoading ? UnitModel.dummyUnits : latestUnits,
                        isLoading: isLoading,
                        errorMessage: status == HomeRequestStatus.failure
                            ? errorMessage
                            : null,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 8.w),
                        itemBuilder: (context, unit) =>
                            UnitListCard(unit: unit),
                        emptyWidget: SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Text(context.l10n.noPropertiesFound),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      ),
    ],
  );
}
