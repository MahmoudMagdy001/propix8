import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/mixins/scroll_pagination_mixin.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/utils/snackbar_utils.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../settings/models/site_settings_model.dart';
import '../../settings/viewmodels/settings_cubit.dart';
import '../../settings/viewmodels/settings_state.dart';
import '../models/faq_model.dart';
import '../models/service_model.dart';
import '../viewmodels/our_services_cubit.dart';
import '../viewmodels/our_services_state.dart';
import 'widgets/contact_us_section.dart';
import 'widgets/faq_item.dart';
import 'widgets/service_item.dart';

class OurServicesView extends StatelessWidget {
  const OurServicesView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        locator<OurServicesCubit>()..loadData(loadTestimonials: false),

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
  static List<ServiceModel> _dummyServices(BuildContext context) =>
      List.generate(
        6,
        (index) => ServiceModel(
          id: 0,
          name: context.l10n.servicePlaceholder,
          description: context.l10n.serviceDescriptionPlaceholder,
          icon: '',
        ),
      );

  static List<FaqModel> _dummyFaqs(BuildContext context) => List.generate(
    4,
    (index) => FaqModel(
      id: 0,
      question: context.l10n.faqQuestionPlaceholder,
      answer: context.l10n.faqAnswerPlaceholder,
    ),
  );

  @override
  void onPageFetched() => context.read<OurServicesCubit>().loadMore();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: const CustomBackButton(),
      title: Text(context.l10n.ourServices),
    ),
    body: InternetStateManager(
      noInternetScreen: const NoInternetScreen(),
      onRestoreInternetConnection: () =>
          context.read<OurServicesCubit>().loadData(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<OurServicesCubit, OurServicesState>(
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
          BlocListener<OurServicesCubit, OurServicesState>(
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
          BlocListener<OurServicesCubit, OurServicesState>(
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
              OurServicesCubit,
              OurServicesState,
              ({
                OurServicesStatus status,
                List<ServiceModel> services,
                List<FaqModel> faqs,
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
                          OurServicesCubit,
                          OurServicesState,
                          String?
                        >(
                          selector: (state) => state.errorMessage,
                          builder: (context, errorMessage) =>
                              Text(errorMessage ?? context.l10n.errorOccurred),
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<OurServicesCubit>().loadData(),
                          child: Text(context.l10n.retry),
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
                    onRefresh: () => context.read<OurServicesCubit>().refresh(),
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
                          SettingsCubit,
                          SettingsState,
                          SiteSettingsModel?
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
