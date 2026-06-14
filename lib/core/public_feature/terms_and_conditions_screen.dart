import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/public_feature/viewmodels/pages_cubit.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) {
      final cubit = locator<PagesCubit>();
      unawaited(cubit.loadPages());
      return cubit;
    },
    child: const _TermsContent(),
  );
}

class _TermsContent extends StatelessWidget {
  const _TermsContent();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: BlocBuilder<PagesCubit, PagesState>(
        builder: (context, state) {
          final page = context.read<PagesCubit>().getPageBySlug(
            'terms-and-conditions',
          );
          final isLoading = state.status == PagesStatus.loading;

          if (state.status == PagesStatus.failure) {
            return Center(child: Text(state.errorMessage ?? 'Error'));
          }

          if (!isLoading && page == null) {
            // Fallback to static if needed, or show empty
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: const CustomBackButton(),
                  floating: true,
                  snap: true,
                  centerTitle: true,
                  title: Text(l10n.termsAndConditions),
                ),
                const SliverFillRemaining(
                  child: Center(child: Text('No data')),
                ),
              ],
            );
          }

          final sections = page?.sections ?? [];

          return InternetStateManager(
            noInternetScreen: const NoInternetScreen(),
            onRestoreInternetConnection: () =>
                context.read<PagesCubit>().loadPages(),
            child: Skeletonizer(
              enabled: isLoading,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: const CustomBackButton(),
                    floating: true,
                    snap: true,
                    centerTitle: true,
                    title: Text(l10n.termsAndConditions),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 16.h,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (isLoading) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: _buildTermSection(
                              context,
                              title: 'Loading Title...',
                              content: ['- Loading content...'],
                              icon: Icons.description_outlined,
                            ),
                          );
                        }
                        final section = sections[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: _buildTermSection(
                            context,
                            title: section.title,
                            content: section.content,
                            icon: _getIconForTitle(section.title),
                          ),
                        );
                      }, childCount: isLoading ? 4 : sections.length),
                    ),
                  ),
                  // Display general content if sections are empty but content exists
                  if (!isLoading && sections.isEmpty && page?.content != null)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Text(page!.content),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getIconForTitle(String title) {
    if (title.contains('الدفع') || title.contains('Payment')) {
      return Icons.calendar_month_outlined;
    }
    if (title.contains('الإلغاء') || title.contains('Cancellation')) {
      return Icons.cancel_schedule_send_outlined;
    }
    if (title.contains('تأمين') || title.contains('Security')) {
      return Icons.security_outlined;
    }
    return Icons.note_alt_outlined;
  }

  Widget _buildTermSection(
    BuildContext context, {
    required String title,
    required List<String> content,
    required IconData icon,
  }) => Container(
    padding: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      color: context.theme.cardTheme.color,
      borderRadius: BorderRadius.circular(16.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .03),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: context.colorScheme.primary, size: 20.r),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
        if (content.isNotEmpty) ...[
          SizedBox(height: 12.h),
          ...content.map(
            (line) => Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                line,
                style: context.textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ],
    ),
  );
}
