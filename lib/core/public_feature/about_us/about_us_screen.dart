import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/responsive_helper.dart';
import '../../../feature/contact/views/contact_form_widget.dart';
import '../../di/locator.dart';
import '../../models/page_model.dart';
import '../../models/stat_model.dart';
import '../../utils/context_extensions.dart';
import '../viewmodels/pages_cubit.dart';
import '../../widgets/app_sliver_grid.dart';
import '../../widgets/custom_back_button.dart';
import 'about_us_section.dart';
import 'about_us_section_title.dart';
import 'about_us_stat_card.dart';
import 'team_member_card.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<PagesCubit>()..loadAll(),
    child: const _AboutUsContent(),
  );
}

class _AboutUsContent extends StatelessWidget {
  const _AboutUsContent();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BlocBuilder<PagesCubit, PagesState>(
      builder: (context, state) {
        if (state.status == PagesStatus.failure) {
          return Center(child: Text(state.errorMessage ?? context.l10n.error));
        }

        final page = context.read<PagesCubit>().getPageBySlug('about-us');
        final isLoading = state.status == PagesStatus.loading;

        if (!isLoading && page == null) {
          return Center(child: Text(context.l10n.noDataFound));
        }

        final teamMembers = page?.teamMembers ?? [];
        final stats = state.stats;

        return InternetStateManager(
          noInternetScreen: const NoInternetScreen(),
          onRestoreInternetConnection: () {
            context.read<PagesCubit>().loadAll();
          },
          child: Skeletonizer(
            enabled: isLoading,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: const CustomBackButton(),
                  floating: true,
                  snap: true,
                  centerTitle: true,
                  title: Text(context.l10n.aboutUs),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .15),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: AboutUsSection(
                        title: page?.title ?? context.l10n.aboutUs,
                        content: page?.content ?? context.l10n.loading,
                        icon: Icons.info_outline,
                      ),
                    ),
                    if (teamMembers.isNotEmpty || isLoading) ...[
                      SizedBox(height: 32.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: AboutUsSectionTitle(
                          title: context.l10n.teamMembers,
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ]),
                ),
                if (teamMembers.isNotEmpty || isLoading)
                  AppSliverGrid<TeamMember?>(
                    items: isLoading ? List.filled(4, null) : teamMembers,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 0.8,
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    itemBuilder: (context, member) =>
                        TeamMemberCard(member: member),
                  ),
                if (stats.isNotEmpty || isLoading) ...[
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(16.w, 32.h, 16.w, 0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        AboutUsSectionTitle(title: context.l10n.statistics),
                        SizedBox(height: 16.h),
                      ]),
                    ),
                  ),
                  AppSliverGrid<StatModel?>(
                    items: isLoading ? List.filled(4, null) : stats,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 1.5,
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    itemBuilder: (context, stat) => AboutUsStatCard(stat: stat),
                  ),
                ],
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    child: const ContactFormWidget(),
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
