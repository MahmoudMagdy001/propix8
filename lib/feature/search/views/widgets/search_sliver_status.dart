import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';
import 'package:propix8/feature/search/viewmodels/search_cubit.dart';
import 'package:propix8/feature/search/viewmodels/search_state.dart';

class SearchSliverStatus extends StatelessWidget {
  const SearchSliverStatus({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        SearchCubit,
        SearchState,
        ({
          HomeRequestStatus status,
          bool hasResults,
          bool hasQuery,
          String? errorMessage,
        })
      >(
        selector: (state) => (
          status: state.status,
          hasResults: state.results.isNotEmpty,
          hasQuery: state.query.isNotEmpty,
          errorMessage: state.errorMessage,
        ),
        builder: (context, result) {
          if (result.status == HomeRequestStatus.loading &&
              !result.hasResults) {
            return const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (result.status == HomeRequestStatus.failure &&
              !result.hasResults) {
            return SliverFillRemaining(
              child: Center(
                child: Text(result.errorMessage ?? context.l10n.errorOccurred),
              ),
            );
          }

          if (result.status == HomeRequestStatus.success &&
              !result.hasResults &&
              result.hasQuery) {
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
                      context.l10n.no_results, // No results
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (!result.hasQuery && !result.hasResults) {
            return SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primaryContainer.withValues(
                          alpha: 0.3,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.search_rounded,
                        size: 48.w,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      context.l10n.search_start_title,
                      textAlign: TextAlign.center,

                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      context.l10n.search_start_subtitle,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return const SliverToBoxAdapter(child: SizedBox.shrink());
        },
      );
}
