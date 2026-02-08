import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/mixins/scroll_pagination_mixin.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../auth/viewmodels/auth_cubit.dart';
import '../../auth/viewmodels/auth_state.dart';
import '../../our_services/models/testimonial_model.dart';
import '../../our_services/viewmodels/our_services_cubit.dart';
import '../../our_services/viewmodels/our_services_state.dart';
import '../../our_services/views/widgets/add_testimonial_sheet.dart';
import '../../our_services/views/widgets/testimonial_item.dart';

class MyTestimonialsView extends StatelessWidget {
  const MyTestimonialsView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        locator<OurServicesCubit>()
          ..loadData(loadServices: false, loadFaqs: false),
    child: const _MyTestimonialsContent(),
  );
}

class _MyTestimonialsContent extends StatefulWidget {
  const _MyTestimonialsContent();

  @override
  State<_MyTestimonialsContent> createState() => _MyTestimonialsContentState();
}

class _MyTestimonialsContentState extends State<_MyTestimonialsContent>
    with ScrollPaginationMixin {
  @override
  void onPageFetched() => context.read<OurServicesCubit>().loadMore();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: const CustomBackButton(),
      title: Text(context.l10n.myTestimonials),
    ),
    body: MultiBlocListener(
      listeners: [
        BlocListener<OurServicesCubit, OurServicesState>(
          listenWhen: (p, c) =>
              p.addTestimonialStatus != c.addTestimonialStatus,
          listener: (context, state) {
            if (state.addTestimonialStatus == OurServicesStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.testimonialAdded)),
              );
            } else if (state.addTestimonialStatus ==
                OurServicesStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.addTestimonialError ??
                        context.l10n.failedToAddTestimonial,
                  ),
                ),
              );
            }
          },
        ),
        BlocListener<OurServicesCubit, OurServicesState>(
          listenWhen: (p, c) =>
              p.updateTestimonialStatus != c.updateTestimonialStatus,
          listener: (context, state) {
            if (state.updateTestimonialStatus == OurServicesStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.testimonialUpdated)),
              );
            } else if (state.updateTestimonialStatus ==
                OurServicesStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.failedToUpdateTestimonial)),
              );
            }
          },
        ),
        BlocListener<OurServicesCubit, OurServicesState>(
          listenWhen: (p, c) =>
              p.deleteTestimonialStatus != c.deleteTestimonialStatus,
          listener: (context, state) {
            if (state.deleteTestimonialStatus == OurServicesStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.testimonialDeleted)),
              );
            } else if (state.deleteTestimonialStatus ==
                OurServicesStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.failedToDeleteTestimonial)),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<OurServicesCubit, OurServicesState>(
        builder: (context, state) {
          if (state.status == OurServicesStatus.loading &&
              state.testimonials == null) {
            return Skeletonizer(
              child: Padding(
                padding: EdgeInsets.fromLTRB(6.r, 16.r, 6.r, 80.h),

                child: TestimonialItem(
                  testimonial: TestimonialModel(
                    id: 0,
                    name: context.l10n.loading,
                    position: context.l10n.loading,
                    content: context.l10n.loadingContent,
                    image: '',
                    status: true,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  ),
                ),
              ),
            );
          }

          if (state.status == OurServicesStatus.failure &&
              state.testimonials == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage ?? context.l10n.errorOccurred),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () => context.read<OurServicesCubit>().loadData(
                      loadServices: false,
                      loadFaqs: false,
                    ),
                    child: Text(context.l10n.retry),
                  ),
                ],
              ),
            );
          }

          return BlocSelector<AuthCubit, AuthState, int?>(
            selector: (authState) => authState.user?.id,
            builder: (context, userId) {
              final allTestimonials = state.testimonials?.data ?? [];
              final hasUserTestimonial =
                  userId != null &&
                  allTestimonials.any((t) => t.userId == userId);

              if (allTestimonials.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.format_quote_rounded,
                        size: 64.r,
                        color: context.colorScheme.outline.withValues(
                          alpha: 0.5,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        context.l10n.noTestimonialsYet,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      if (!hasUserTestimonial)
                        ElevatedButton.icon(
                          onPressed: () => AddTestimonialSheet.show(context),
                          icon: const Icon(Icons.add),
                          label: Text(context.l10n.addTestimonial),
                        ),
                    ],
                  ),
                );
              }

              return Stack(
                children: [
                  RefreshIndicator(
                    onRefresh: () => context.read<OurServicesCubit>().loadData(
                      loadServices: false,
                      loadFaqs: false,
                      isRefreshing: true,
                    ),
                    child: ListView.separated(
                      controller: scrollController,
                      padding: EdgeInsets.fromLTRB(6.r, 16.r, 6.r, 80.h),
                      itemCount:
                          allTestimonials.length +
                          (state.isMoreLoading ? 1 : 0),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.h),
                      itemBuilder: (context, index) {
                        if (index == allTestimonials.length) {
                          return Padding(
                            padding: EdgeInsets.all(16.r),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        return TestimonialItem(
                          testimonial: allTestimonials[index],
                        );
                      },
                    ),
                  ),
                  if (!hasUserTestimonial)
                    Positioned(
                      bottom: 20.h,
                      right: 20.w,
                      child: FloatingActionButton.extended(
                        onPressed: () => AddTestimonialSheet.show(context),
                        icon: const Icon(Icons.add),
                        label: Text(context.l10n.addTestimonial),
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    ),
  );
}
