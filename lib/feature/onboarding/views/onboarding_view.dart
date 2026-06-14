import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/public_feature/services/storage_service.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/feature/onboarding/models/onboarding_model.dart';
import 'package:propix8/feature/onboarding/viewmodels/onboarding_cubit.dart';
import 'package:propix8/feature/onboarding/viewmodels/onboarding_state.dart';
import 'package:propix8/feature/onboarding/views/widgets/onboarding_content.dart';
import 'package:propix8/feature/settings/viewmodels/settings_cubit.dart';
import 'package:propix8/feature/settings/viewmodels/settings_state.dart';

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
          unawaited(context.read<SettingsCubit>().loadSiteSettings());
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
            unawaited(precacheImage(CachedNetworkImageProvider(imageUrl), context));
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
  Widget build(BuildContext context) => Scaffold(
    body: BlocSelector<OnboardingCubit, OnboardingState, List<OnboardingModel>>(
      selector: (state) => state.pages,
      builder: (context, pages) {
        if (pages.isEmpty) {
          return const SizedBox.shrink();
        }

        return Stack(
          children: [
            // Content - PageView only rebuilds when pages change
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: pages.length,
                    onPageChanged: (index) {
                      context.read<OnboardingCubit>().updatePageIndex(index);
                    },
                    itemBuilder: (context, index) => OnboardingContent(
                      title: pages[index].title,
                      subtitle: pages[index].subtitle,
                      imagePath: pages[index].imagePath,
                    ),
                  ),
                ),
              ],
            ),

            // Bottom controls - only rebuild when pageIndex changes
            const _OnboardingControls(),
          ],
        );
      },
    ),
  );
}

class _OnboardingControls extends StatelessWidget {
  const _OnboardingControls();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Positioned(
      bottom: 30.h,
      left: 24.w,
      right: 24.w,
      child:
          BlocSelector<
            OnboardingCubit,
            OnboardingState,
            ({int pageIndex, int pageCount})
          >(
            selector: (state) =>
                (pageIndex: state.pageIndex, pageCount: state.pages.length),
            builder: (context, data) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Page Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(data.pageCount, (index) {
                    final isActive = data.pageIndex == index;
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
                if (data.pageIndex == data.pageCount - 1)
                  // Last Page: Start Now
                  AppElevatedButton(
                    width: double.infinity,
                    onPressed: () => _completeOnboarding(context),
                    text: l10n.startNow,
                  )
                else
                  // Pages 0 & 1: Next + Back/Skip
                  Row(
                    children: [
                      Expanded(
                        child: AppElevatedButton(
                          onPressed: () {
                            final controller = context
                                .findAncestorStateOfType<
                                  _OnboardingViewBodyState
                                >()
                                ?._pageController;
                            if (controller != null) {
                              unawaited(controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              ));
                            }
                          },
                          text: l10n.next,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: AppElevatedButton(
                          onPressed: () {
                            final state = context
                                .findAncestorStateOfType<
                                  _OnboardingViewBodyState
                                >();
                            final controller = state?._pageController;
                            if (data.pageIndex > 0) {
                              if (controller != null) {
                                unawaited(controller.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                ));
                              }
                            } else {
                              _completeOnboarding(context);
                            }
                          },
                          backgroundColor: context.colorScheme.secondary,
                          foregroundColor: context.colorScheme.onSecondary,
                          text: data.pageIndex == 0 ? l10n.skip : l10n.back,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
    );
  }

  void _completeOnboarding(BuildContext context) {
    final state = context
        .findAncestorStateOfType<_OnboardingViewBodyState>();
    if (state != null) {
      unawaited(state._completeOnboarding());
    }
  }
}
