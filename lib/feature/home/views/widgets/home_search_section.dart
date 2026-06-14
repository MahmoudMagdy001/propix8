import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_modal_sheet.dart';
import 'package:propix8/core/widgets/app_segmented_toggle.dart';
import 'package:propix8/feature/auth/repositories/address_setup_repository.dart';
import 'package:propix8/feature/home/viewmodels/home_cubit.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';
import 'package:propix8/feature/home/views/filter/viewmodels/filter_cubit.dart';
import 'package:propix8/feature/home/views/filter/viewmodels/filter_state.dart';
import 'package:propix8/feature/home/views/filter/views/filter_sheet_content.dart';

class HomeSearchSection extends StatelessWidget {
  const HomeSearchSection({super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child:
        BlocSelector<
          HomeCubit,
          HomeState,
          ({HomeTab? activeTab, FilterState? filterState})
        >(
          selector: (state) =>
              (activeTab: state.activeTab, filterState: state.filterState),
          builder: (context, data) {
            final activeTab = data.activeTab;
            final filterState = data.filterState;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.3,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  // Buy/Rent Toggle
                  AppSegmentedToggle<HomeTab?>(
                    values: HomeTab.values,
                    activeValue: activeTab,
                    backgroundColor: context.colorScheme.surface,
                    onChanged: (tab) =>
                        context.read<HomeCubit>().changeTab(tab),
                    labelBuilder: (tab) => switch (tab) {
                      HomeTab.buy => context.l10n.buy,
                      HomeTab.rent => context.l10n.rent,
                      _ => '',
                    },
                  ),
                  SizedBox(height: 16.h),
                  // Search Bar Area
                  GestureDetector(
                    onTap: () => context.pushNamed(AppRoutes.search),
                    child: Row(
                      children: [
                        // Location Input
                        Expanded(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: context.colorScheme.surface,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search_rounded,
                                  color: context.colorScheme.primary,
                                  size: 22.w,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  context.l10n.searchPropertyPlaceholder,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: context.colorScheme.onSurfaceVariant
                                        .withValues(alpha: 0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),

                        // Filter/Reset Button
                        if (filterState != null)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: context.colorScheme.error.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () =>
                                    context.read<HomeCubit>().resetFilters(),
                                borderRadius: BorderRadius.circular(12.r),
                                child: Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: Icon(
                                    Icons.close_rounded,
                                    color: context.colorScheme.error,
                                    size: 22.w,
                                  ),
                                ),
                              ),
                            ),
                          )
                        else
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: context.colorScheme.surface,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () async {
                                  final homeCubit = context.read<HomeCubit>();
                                  final result =
                                      await showModalBottomSheet<FilterState>(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) => MultiBlocProvider(
                                          providers: [
                                            BlocProvider.value(
                                              value: homeCubit,
                                            ),
                                            BlocProvider(
                                              create: (context) {
                                                final cubit = FilterCubit(
                                                  locator<
                                                    AddressSetupRepository
                                                  >(),
                                                );
                                                unawaited(cubit.fetchCities());
                                                return cubit;
                                              },
                                            ),
                                          ],
                                          child: Builder(
                                            builder: (context) =>
                                                AppModalSheetLayout(
                                                  title: context.l10n.filter,
                                                  action: TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<FilterCubit>()
                                                          .reset();
                                                      homeCubit.resetFilters();
                                                    },
                                                    child: Text(
                                                      context.l10n.reset,
                                                      style: context
                                                          .textTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                            color: context
                                                                .colorScheme
                                                                .error,
                                                          ),
                                                    ),
                                                  ),
                                                  child:
                                                      const FilterSheetContent(),
                                                ),
                                          ),
                                        ),
                                      );

                                  if (result != null && context.mounted) {
                                    homeCubit.applyFilters(result);
                                  }
                                },
                                borderRadius: BorderRadius.circular(12.r),
                                child: Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: Icon(
                                    Icons.tune_rounded,
                                    color: context.colorScheme.onSurfaceVariant
                                        .withValues(alpha: 0.6),
                                    size: 22.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
  );
}
