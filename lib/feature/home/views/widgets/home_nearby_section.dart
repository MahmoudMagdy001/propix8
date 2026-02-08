import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_sliver_list.dart';
import '../../../../core/widgets/unit_list_card.dart';
import '../../models/unit_model.dart';
import '../../viewmodels/home_cubit.dart';
import '../../viewmodels/home_state.dart';

class HomeNearbySection extends StatelessWidget {
  const HomeNearbySection({super.key});

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
                context.l10n.nearbyProperties,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () => context.pushNamed(AppRoutes.nearbyProperties),
                child: Text(context.l10n.seeAll),
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
                List<UnitModel> nearbyUnits,
                String? errorMessage,
              })
            >(
              selector: (state) => (
                status: state.nearbyStatus,
                nearbyUnits: state.nearbyUnits,
                errorMessage: state.errorMessage,
              ),
              builder: (context, data) {
                final status = data.status;
                final nearbyUnits = data.nearbyUnits;
                final errorMessage = data.errorMessage;

                final isLoading = status == HomeRequestStatus.loading;

                return SizedBox(
                  height: 255.h,
                  child: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      AppSliverList<UnitModel>(
                        items: isLoading ? UnitModel.dummyUnits : nearbyUnits,
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
