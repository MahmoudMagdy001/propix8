import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/home/domain/entities/category_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_bloc.dart';
import 'package:propix8/feature/home/presentation/bloc/home_event.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeCategoryFilters extends StatelessWidget {
  const HomeCategoryFilters({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;

    return SliverToBoxAdapter(
      child:
          BlocSelector<
            HomeBloc,
            HomeState,
            ({
              HomeRequestStatus categoryStatus,
              List<CategoryEntity> categories,
              int? selectedUnitTypeId,
            })
          >(
            selector: (state) => (
              categoryStatus: state.categoryStatus,
              categories: state.categories,
              selectedUnitTypeId: state.selectedUnitTypeId,
            ),
            builder: (context, data) {
              final categoryStatus = data.categoryStatus;
              final categoriesList = data.categories;
              final selectedUnitTypeId = data.selectedUnitTypeId;

              final isLoading =
                  categoryStatus == HomeRequestStatus.loading &&
                  categoriesList.isEmpty;

              final categories = isLoading
                  ? CategoryEntity.dummyCategories
                  : categoriesList;

              return Skeletonizer(
                enabled: isLoading,
                child: SizedBox(
                  height: 45.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length + (isLoading ? 0 : 1),
                    separatorBuilder: (context, index) => SizedBox(width: 8.w),
                    itemBuilder: (context, index) {
                      final isAll = !isLoading && index == 0;
                      final category = isAll
                          ? null
                          : categories[isLoading ? index : index - 1];
                      final isSelected =
                          !isLoading &&
                          (isAll
                              ? selectedUnitTypeId == null
                              : selectedUnitTypeId == category?.id);

                      return GestureDetector(
                        onTap: isLoading
                            ? null
                            : () {
                                final targetId = isAll ? null : category?.id;
                                if (selectedUnitTypeId == targetId) {
                                  context.read<HomeBloc>().add(
                                    const HomeEvent.categorySelected(null),
                                  );
                                } else {
                                  context.read<HomeBloc>().add(
                                    HomeEvent.categorySelected(targetId),
                                  );
                                }
                              },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? colors.primary
                                : colors.surfaceContainerHighest.withValues(
                                    alpha: 0.5,
                                  ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          alignment: Alignment.center,
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: (typography.labelLarge ?? const TextStyle())
                                .copyWith(
                                  color: isSelected
                                      ? colors.onPrimary
                                      : colors.onSurfaceVariant,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                            child: Text(
                              isAll ? context.l10n.all : (category?.name ?? ''),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
    );
  }
}
