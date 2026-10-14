import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_list.dart';
import 'package:propix8/core/widgets/unit_list_card.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_bloc.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';

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
                style: context.typography.titleLarge?.copyWith(
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
              HomeBloc,
              HomeState,
              ({
                HomeRequestStatus status,
                List<UnitEntity> nearbyUnits,
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
                      AppSliverList<UnitEntity>(
                        items: isLoading ? UnitEntity.dummyUnits : nearbyUnits,
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
