import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_grid.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/feature/contact/presentation/widgets/contact_form_widget.dart';
import 'package:propix8/feature/static_pages/domain/entities/page_entity.dart';
import 'package:propix8/feature/static_pages/domain/entities/stat_entity.dart';
import 'package:propix8/feature/static_pages/presentation/bloc/pages_bloc.dart';
import 'package:propix8/feature/static_pages/presentation/bloc/pages_event.dart';
import 'package:propix8/feature/static_pages/presentation/bloc/pages_state.dart';
import 'package:propix8/feature/static_pages/presentation/widgets/about_us_section.dart';
import 'package:propix8/feature/static_pages/presentation/widgets/about_us_section_title.dart';
import 'package:propix8/feature/static_pages/presentation/widgets/about_us_stat_card.dart';
import 'package:propix8/feature/static_pages/presentation/widgets/team_member_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        locator<PagesBloc>()..add(const PagesAllDataRequested()),
    child: const _AboutUsContent(),
  );
}

class _AboutUsContent extends StatelessWidget {
  const _AboutUsContent();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BlocBuilder<PagesBloc, PagesState>(
      builder: (context, state) {
        if (state.status == PagesStatus.failure) {
          return Center(child: Text(state.errorMessage ?? context.l10n.error));
        }

        final page = context.read<PagesBloc>().state.getPageBySlug('about-us');
        final isLoading = state.status == PagesStatus.loading;

        if (!isLoading && page == null) {
          return Center(child: Text(context.l10n.noDataFound));
        }

        final teamMembers = page?.teamMembers ?? [];
        final stats = state.stats;

        return InternetStateManager(
          noInternetScreen: const NoInternetScreen(),
          onRestoreInternetConnection: () {
            context.read<PagesBloc>().add(const PagesAllDataRequested());
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
                  AppSliverGrid<TeamMemberEntity?>(
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
                  AppSliverGrid<StatEntity?>(
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
