import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../core/public_feature/services/storage_service.dart';
import '../../../core/utils/context_extensions.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../settings/viewmodels/settings_cubit.dart';
import '../../settings/viewmodels/settings_state.dart';
import '../viewmodels/onboarding_cubit.dart';
import '../viewmodels/onboarding_state.dart';
import 'widgets/onboarding_content.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<OnboardingCubit>(),
    child: BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        // Lazy load site settings only when onboarding is shown
        // This avoids loading site settings for logged-in users
        if (state.siteSettings == null && state.errorMessage == null) {
          // Trigger load if not already loading
          context.read<SettingsCubit>().loadSiteSettings();
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // If we have settings, or if there was an error (fallback to defaults), show the onboarding.
        return _OnboardingViewBody(
          homeHeroImages: state.siteSettings?.homeHeroImages,
        );
      },
    ),
  );
}

class _OnboardingViewBody extends StatefulWidget {
  const _OnboardingViewBody({this.homeHeroImages});
  final List<String>? homeHeroImages;

  @override
  State<_OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<_OnboardingViewBody> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<OnboardingCubit>().loadPages(
          context.l10n,
          images: widget.homeHeroImages,
        );
        // Pre-cache images
        if (widget.homeHeroImages != null) {
          for (final imageUrl in widget.homeHeroImages!) {
            precacheImage(CachedNetworkImageProvider(imageUrl), context);
          }
        }
      }
    });
  }

  @override
  void didUpdateWidget(_OnboardingViewBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.homeHeroImages != oldWidget.homeHeroImages) {
      context.read<OnboardingCubit>().loadPages(
        context.l10n,
        images: widget.homeHeroImages,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    await locator<StorageService>().saveOnboardingSeen();
    if (mounted) {
      context.goNamed(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          if (state.pages.isEmpty) {
            return const SizedBox.shrink();
          }

          return Stack(
            children: [
              // Content
              Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: state.pages.length,
                      onPageChanged: (index) {
                        context.read<OnboardingCubit>().updatePageIndex(index);
                      },
                      itemBuilder: (context, index) => OnboardingContent(
                        title: state.pages[index].title,
                        subtitle: state.pages[index].subtitle,
                        imagePath: state.pages[index].imagePath,
                      ),
                    ),
                  ),
                ],
              ),

              // Bottom Sheet / Controls
              Positioned(
                bottom: 30.h,
                left: 24.w,
                right: 24.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Page Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(state.pages.length, (index) {
                        final isActive = state.pageIndex == index;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: isActive ? 32.w : 6.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: isActive
                                ? context.colorScheme.primary
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(
                              isActive ? 4.r : 3.r,
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 32.h),

                    // Buttons
                    if (state.pageIndex == state.pages.length - 1)
                      // Last Page: Start Now
                      SizedBox(
                        width: double.infinity,
                        child: AppElevatedButton(
                          onPressed: _completeOnboarding,
                          text: l10n.startNow,
                        ),
                      )
                    else
                      // Pages 0 & 1: Next + Back/Skip
                      Row(
                        children: [
                          Expanded(
                            child: AppElevatedButton(
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              text: l10n.next,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: AppElevatedButton(
                              onPressed: () {
                                if (state.pageIndex > 0) {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                } else {
                                  _completeOnboarding();
                                }
                              },
                              backgroundColor: context.colorScheme.secondary,
                              foregroundColor: context.colorScheme.onSecondary,
                              text: state.pageIndex == 0
                                  ? l10n.skip
                                  : l10n.back,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
