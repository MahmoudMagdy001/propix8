import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../models/banner_model.dart';
import '../../viewmodels/home_cubit.dart';
import '../../viewmodels/home_state.dart';

class HomeBannerSection extends StatelessWidget {
  const HomeBannerSection({super.key});

  /// Handles banner tap and navigates to the appropriate screen based on URL.
  void _handleBannerTap(BuildContext context, String url) {
    switch (url) {
      case '/units':
        context.goNamed(AppRoutes.layout);
      case '/about':
        context.pushNamed(AppRoutes.aboutUs);
      case '/services':
        context.pushNamed(AppRoutes.ourServices);
      case '/contact':
        // Contact form is inside About Us screen
        context.pushNamed(AppRoutes.aboutUs);
      case '/faq':
        // FAQs section is inside Our Services screen
        context.pushNamed(AppRoutes.ourServices);
      default:
        // Handle unknown or empty URLs gracefully
        break;
    }
  }

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child:
        BlocSelector<
          HomeCubit,
          HomeState,
          ({HomeRequestStatus bannerStatus, List<BannerModel> banners})
        >(
          selector: (state) =>
              (bannerStatus: state.bannerStatus, banners: state.banners),
          builder: (context, data) {
            final bannerStatus = data.bannerStatus;
            final bannersList = data.banners;

            final isLoading = bannerStatus == HomeRequestStatus.loading;
            final banners = isLoading ? BannerModel.dummyBanners : bannersList;

            if (!isLoading && banners.isEmpty) {
              return const SizedBox.shrink();
            }

            return Skeletonizer(
              enabled: isLoading,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 160.h,
                  viewportFraction: 0.83,
                  enlargeCenterPage: true,
                  autoPlay: !isLoading,
                ),
                items: banners
                    .map(
                      (banner) => Builder(
                        builder: (BuildContext context) => Container(
                          margin: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: GestureDetector(
                            onTap: isLoading
                                ? null
                                : () => _handleBannerTap(context, banner.url),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: CachedNetworkImage(
                                imageUrl: banner.image,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                memCacheHeight: 160 * 2,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.broken_image),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
  );
}
