import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_image_viewer.dart';

typedef ImageUrlBuilder<T> = String Function(T item);

class ReusableSliverCarousel<T> extends StatefulWidget {
  const ReusableSliverCarousel({
    required this.items,
    required this.imageUrlBuilder,
    this.title,
    this.overlay,
    super.key,
  });

  final List<T> items;
  final ImageUrlBuilder<T> imageUrlBuilder;
  final String? title; // العنوان اختياري
  final Widget? overlay;

  @override
  State<ReusableSliverCarousel<T>> createState() =>
      _ReusableSliverCarouselState<T>();
}

class _ReusableSliverCarouselState<T> extends State<ReusableSliverCarousel<T>> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox());
    }

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                widget.title!,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              ),
            ),
            SizedBox(height: 8.h),
          ],
          Stack(
            children: [
              if (widget.items.length == 1)
                GestureDetector(
                  onTap: () => AppImageViewer.show(
                    context,
                    widget.items.map(widget.imageUrlBuilder).toList(),
                  ),
                  child: CachedNetworkImage(
                    memCacheHeight: 200 * 3,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                    imageUrl: widget.imageUrlBuilder(widget.items.first),
                    width: double.infinity,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                )
              else
                Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.h,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() => _currentIndex = index);
                        },
                      ),
                      items: widget.items
                          .asMap()
                          .entries
                          .map(
                            (entry) => GestureDetector(
                              onTap: () => AppImageViewer.show(
                                context,
                                widget.items
                                    .map(widget.imageUrlBuilder)
                                    .toList(),
                                initialIndex: entry.key,
                              ),
                              child: CachedNetworkImage(
                                memCacheHeight: 200 * 3,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.broken_image),
                                imageUrl: widget.imageUrlBuilder(entry.value),
                                width: double.infinity,
                                height: 200.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.items.asMap().entries.map((entry) {
                        final isActive = _currentIndex == entry.key;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: isActive ? 24.w : 8.w,
                          height: 4.h,
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              isActive ? 6.r : 50.r,
                            ),
                            color: context.colorScheme.primary.withValues(
                              alpha: isActive ? 0.9 : 0.2,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              if (widget.overlay != null)
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: widget.overlay,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
