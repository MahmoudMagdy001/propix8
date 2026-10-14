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
import 'package:propix8/feature/home/presentation/bloc/home_bloc.dart';
import 'package:propix8/feature/home/presentation/bloc/home_event.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_bloc.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_event.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_state.dart';
import 'package:propix8/feature/home/presentation/filter/widgets/filter_sheet_content.dart';

class HomeSearchSection extends StatelessWidget {
  const HomeSearchSection({super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child:
        BlocSelector<
          HomeBloc,
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
                color: context.colors.surfaceContainerHighest.withValues(
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
                    backgroundColor: context.colors.surface,
                    onChanged: (tab) => context.read<HomeBloc>().add(
                          HomeEvent.tabChanged(tab),
                        ),
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
                              color: context.colors.surface,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search_rounded,
                                  color: context.colors.primary,
                                  size: 22.w,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  context.l10n.searchPropertyPlaceholder,
                                  style: context.typography.bodyMedium
                                      ?.copyWith(
                                        color: context.colors.onSurfaceVariant
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
                              color: context.colors.error.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => context.read<HomeBloc>().add(
                                      const HomeEvent.filterCleared(),
                                    ),
                                borderRadius: BorderRadius.circular(12.r),
                                child: Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: Icon(
                                    Icons.close_rounded,
                                    color: context.colors.error,
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
                              color: context.colors.surface,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () async {
                                  final homeBloc = context.read<HomeBloc>();
                                  final result =
                                      await showModalBottomSheet<FilterState>(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) => MultiBlocProvider(
                                          providers: [
                                            BlocProvider.value(
                                              value: homeBloc,
                                            ),
                                            BlocProvider(
                                              create: (context) => FilterBloc(
                                                locator<
                                                  AddressSetupRepository
                                                >(),
                                              )..add(
                                                const FilterEvent
                                                    .citiesRequested(),
                                              ),
                                            ),
                                          ],
                                          child: Builder(
                                            builder: (context) =>
                                                AppModalSheetLayout(
                                                  title: context.l10n.filter,
                                                  action: TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<FilterBloc>()
                                                          .add(
                                                            const FilterEvent
                                                                .reset(),
                                                          );
                                                      homeBloc.add(
                                                        const HomeEvent
                                                            .filterCleared(),
                                                      );
                                                    },
                                                    child: Text(
                                                      context.l10n.reset,
                                                      style: context
                                                          .typography
                                                          .bodyMedium
                                                          ?.copyWith(
                                                            color: context
                                                                .colors
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
                                    homeBloc.add(
                                      HomeEvent.filterApplied(result),
                                    );
                                  }
                                },
                                borderRadius: BorderRadius.circular(12.r),
                                child: Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: Icon(
                                    Icons.tune_rounded,
                                    color: context.colors.onSurfaceVariant
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
