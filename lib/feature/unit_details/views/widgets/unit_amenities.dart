import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../models/unit_details_model.dart';
import '../../viewmodels/unit_details_cubit.dart';
import '../../viewmodels/unit_details_state.dart';
import 'section_header.dart';

class UnitAmenities extends StatefulWidget {
  const UnitAmenities({super.key});

  @override
  State<UnitAmenities> createState() => _UnitAmenitiesState();
}

class _UnitAmenitiesState extends State<UnitAmenities> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) =>
      BlocSelector<UnitDetailsCubit, UnitDetailsState, List<AmenityModel>>(
        selector: (state) => state.unit?.amenities ?? [],
        builder: (context, amenities) {
          if (amenities.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox());
          }
          const maxItems = 4;
          final itemsToShow = showAll
              ? amenities
              : amenities.take(maxItems).toList();

          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(title: context.l10n.amenities),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),

                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 4.w,
                      mainAxisSpacing: 4.h,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: itemsToShow.length,
                    itemBuilder: (context, index) {
                      final amenity = itemsToShow[index];
                      return Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: context.theme.cardTheme.color,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: amenity.icon,
                              height: 30.h,
                              width: 30.w,
                              memCacheHeight: 30 * 3,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.broken_image_outlined),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              amenity.name,
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                if (amenities.length > maxItems)
                  Center(
                    child: TextButton(
                      onPressed: () => setState(() => showAll = !showAll),
                      child: Text(
                        showAll ? context.l10n.showLess : context.l10n.showMore,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      );
}
