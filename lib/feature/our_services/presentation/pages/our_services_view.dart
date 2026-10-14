import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/mixins/scroll_pagination_mixin.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/feature/our_services/domain/entities/faq_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/service_entity.dart';
import 'package:propix8/feature/our_services/presentation/bloc/our_services_bloc.dart';
import 'package:propix8/feature/our_services/presentation/bloc/our_services_event.dart';
import 'package:propix8/feature/our_services/presentation/bloc/our_services_state.dart';
import 'package:propix8/feature/our_services/presentation/widgets/contact_us_section.dart';
import 'package:propix8/feature/our_services/presentation/widgets/faq_item.dart';
import 'package:propix8/feature/our_services/presentation/widgets/service_item.dart';
import 'package:propix8/feature/settings/domain/entities/site_settings_entity.dart';
import 'package:propix8/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:propix8/feature/settings/presentation/bloc/settings_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OurServicesView extends StatelessWidget {
  const OurServicesView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        locator<OurServicesBloc>()
          ..add(const OurServicesEvent.dataRequested(loadTestimonials: false)),
    child: const OurServicesContent(),
  );
}

class OurServicesContent extends StatefulWidget {
  const OurServicesContent({super.key});

  @override
  State<OurServicesContent> createState() => _OurServicesContentState();
}

class _OurServicesContentState extends State<OurServicesContent>
    with ScrollPaginationMixin {
  static List<ServiceEntity> _dummyServices(BuildContext context) =>
      List.generate(
        6,
        (index) => ServiceEntity(
          id: 0,
          name: context.l10n.servicePlaceholder,
          description: context.l10n.serviceDescriptionPlaceholder,
          icon: '',
        ),
      );

  static List<FaqEntity> _dummyFaqs(BuildContext context) => List.generate(
    4,
    (index) => FaqEntity(
      id: 0,
      question: context.l10n.faqQuestionPlaceholder,
      answer: context.l10n.faqAnswerPlaceholder,
    ),
  );

  @override
  void onPageFetched() => context.read<OurServicesBloc>().add(
    const OurServicesEvent.moreTestimonialsRequested(),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: const CustomBackButton(),
      title: Text(context.l10n.ourServices),
    ),
    body: InternetStateManager(
      noInternetScreen: const NoInternetScreen(),
      onRestoreInternetConnection: () => context.read<OurServicesBloc>().add(
        const OurServicesEvent.dataRequested(loadTestimonials: false),
      ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<OurServicesBloc, OurServicesState>(
            listenWhen: (p, c) =>
                p.addTestimonialStatus != c.addTestimonialStatus,
            listener: (context, state) {
              if (state.addTestimonialStatus == OurServicesStatus.success) {
                context.showSuccessSnackbar(context.l10n.testimonialAdded);
              } else if (state.addTestimonialStatus ==
                  OurServicesStatus.failure) {
                context.showErrorSnackbar(
                  state.addTestimonialError ??
                      context.l10n.failedToAddTestimonial,
                );
              }
            },
          ),
          BlocListener<OurServicesBloc, OurServicesState>(
            listenWhen: (p, c) =>
                p.updateTestimonialStatus != c.updateTestimonialStatus,
            listener: (context, state) {
              if (state.updateTestimonialStatus == OurServicesStatus.success) {
                context.showSuccessSnackbar(context.l10n.testimonialUpdated);
              } else if (state.updateTestimonialStatus ==
                  OurServicesStatus.failure) {
                context.showErrorSnackbar(
                  context.l10n.failedToUpdateTestimonial,
                );
              }
            },
          ),
          BlocListener<OurServicesBloc, OurServicesState>(
            listenWhen: (p, c) =>
                p.deleteTestimonialStatus != c.deleteTestimonialStatus,
            listener: (context, state) {
              if (state.deleteTestimonialStatus == OurServicesStatus.success) {
                context.showSuccessSnackbar(context.l10n.testimonialDeleted);
              } else if (state.deleteTestimonialStatus ==
                  OurServicesStatus.failure) {
                context.showErrorSnackbar(
                  context.l10n.failedToDeleteTestimonial,
                );
              }
            },
          ),
        ],
        child:
            BlocSelector<
              OurServicesBloc,
              OurServicesState,
              ({
                OurServicesStatus status,
                List<ServiceEntity> services,
                List<FaqEntity> faqs,
                bool isMoreLoading,
              })
            >(
              selector: (state) => (
                status: state.status,
                services: state.services,
                faqs: state.faqs,
                isMoreLoading: state.isMoreLoading,
              ),
              builder: (context, servicesData) {
                final status = servicesData.status;
                final isLoading = status == OurServicesStatus.loading;

                if (status == OurServicesStatus.failure) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocSelector<
                          OurServicesBloc,
                          OurServicesState,
                          String?
                        >(
                          selector: (state) => state.errorMessage,
                          builder: (context, errorMessage) =>
                              Text(errorMessage ?? context.l10n.errorOccurred),
                        ),
                        SizedBox(height: 16.h),
                        AppElevatedButton(
                          onPressed: () => context.read<OurServicesBloc>().add(
                            const OurServicesEvent.dataRequested(
                              loadTestimonials: false,
                            ),
                          ),
                          text: context.l10n.retry,
                        ),
                      ],
                    ),
                  );
                }

                final services = isLoading
                    ? _dummyServices(context)
                    : servicesData.services;
                final faqs = isLoading
                    ? _dummyFaqs(context)
                    : servicesData.faqs;

                return Skeletonizer(
                  enabled: isLoading,
                  child: RefreshIndicator(
                    onRefresh: () async => context.read<OurServicesBloc>().add(
                      const OurServicesEvent.refreshed(),
                    ),
                    child: ListView(
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 4.h,
                      ),
                      children: [
                        _buildSectionTitle(context, context.l10n.ourServices),
                        SizedBox(height: 12.h),
                        ...services.map(
                          (service) => ServiceItem(service: service),
                        ),
                        SizedBox(height: 16.h),
                        _buildSectionTitle(context, context.l10n.faqs),
                        SizedBox(height: 12.h),
                        ...faqs.map((faq) => FaqItem(faq: faq)),
                        SizedBox(height: 4.h),

                        BlocSelector<
                          SettingsBloc,
                          SettingsState,
                          SiteSettingsEntity?
                        >(
                          selector: (state) => state.siteSettings,
                          builder: (context, siteSettings) {
                            if (siteSettings == null) {
                              return const SizedBox.shrink();
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 24.h),
                                _buildSectionTitle(
                                  context,
                                  context.l10n.contactUs,
                                ),
                                SizedBox(height: 12.h),
                                ContactUsSection(settings: siteSettings),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      ),
    ),
  );

  Widget _buildSectionTitle(BuildContext context, String title) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0.w),
    child: Text(
      title,
      style: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: context.colorScheme.primary,
      ),
    ),
  );
}
