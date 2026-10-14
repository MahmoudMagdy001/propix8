import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/section_header.dart';

class UnitAmenities extends StatefulWidget {
  const UnitAmenities({super.key});

  @override
  State<UnitAmenities> createState() => _UnitAmenitiesState();
}

class _UnitAmenitiesState extends State<UnitAmenities> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) =>
      BlocSelector<UnitDetailsBloc, UnitDetailsState, List<UnitAmenityEntity>>(
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
                  child: Column(
                    children: List.generate(
                      (itemsToShow.length / 4).ceil(),
                      (rowIndex) {
                        final startIndex = rowIndex * 4;
                        final endIndex =
                            (startIndex + 4).clamp(0, itemsToShow.length);
                        final rowItems =
                            itemsToShow.sublist(startIndex, endIndex);

                        return Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: Row(
                            children: [
                              for (final amenity in rowItems)
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Container(
                                      height: 80.h,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                        vertical: 8.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: context.theme.cardTheme.color,
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: amenity.icon,
                                            width: 24.w,
                                            height: 24.h,
                                            color: context.colorScheme.primary,
                                            errorWidget: (context, url,
                                                    error) =>
                                                Icon(
                                              Icons.star_outline,
                                              size: 20.sp,
                                              color:
                                                  context.colorScheme.primary,
                                            ),
                                          ),
                                          SizedBox(height: 6.h),
                                          Flexible(
                                            child: Text(
                                              amenity.name,
                                              style: context
                                                  .textTheme.labelSmall
                                                  ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              for (int i = 0; i < (4 - rowItems.length); i++)
                                const Expanded(child: SizedBox()),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (amenities.length > maxItems)
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showAll = !showAll;
                        });
                      },
                      child: Text(
                        showAll ? context.l10n.showLess : context.l10n.showMore,
                        style: TextStyle(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.w600,
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
