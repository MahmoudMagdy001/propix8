import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/responsive_helper.dart';
import '../../models/banner_model.dart';
import '../../viewmodels/home_cubit.dart';
import '../../viewmodels/home_state.dart';

class HomeBannerSection extends StatelessWidget {
  const HomeBannerSection({super.key});

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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: CachedNetworkImage(
                              imageUrl: banner.image,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              memCacheHeight: 160 * 3,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.broken_image),
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
