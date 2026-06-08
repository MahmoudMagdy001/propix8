import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/favorite_button.dart';
import 'package:propix8/feature/home/models/unit_model.dart';

class UnitListCard extends StatelessWidget {
  const UnitListCard({required this.unit, super.key});
  final UnitModel unit;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 250.w,
    child: Material(
      color: context.theme.cardTheme.color,
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: () {
          context.pushNamed(
            AppRoutes.propertyDetails,
            pathParameters: {'id': unit.id.toString()},
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: unit.imageUrl ?? '',
                    height: 130.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    memCacheHeight: 130 * 3,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: FavoriteButton(
                    unit: unit,
                    isFavorite: unit.isFavorite ?? false,
                    size: 25.sp,
                    color: Colors.white,
                  ),
                ),
                if (unit.offerType != null)
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(16.r),
                          topEnd: Radius.circular(16.r),
                        ),
                      ),
                      child: Text(
                        _getLocalizedOfferType(context, unit.offerType!),
                        style: context.textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // Content Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Price
                  Text(
                    unit.price.formatCurrency(
                      isArabic: context.l10n.localeName == 'ar',
                    ),
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),

                  // Title
                  Text(
                    unit.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Address
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          unit.address ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  // Features
                  Container(
                    padding: EdgeInsets.only(top: 8.h),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildFeature(
                          context,
                          icon: 'assets/icons/measure.png',
                          label:
                              '${unit.area?.toStringAsFixed(0)} ${context.l10n.unit_specs_area_unit}',
                        ),
                        _buildDivider(),
                        _buildFeature(
                          context,
                          icon: 'assets/icons/bedroom.png',
                          label:
                              '${unit.bedrooms} ${context.l10n.unit_specs_rooms}',
                        ),
                        _buildDivider(),
                        _buildFeature(
                          context,
                          icon: 'assets/icons/bathroom.png',
                          label:
                              '${unit.bathrooms} ${context.l10n.unit_specs_bathrooms}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildDivider() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.w),
    child: Container(height: 12.h, width: 1.w, color: Colors.grey.shade400),
  );

  Widget _buildFeature(
    BuildContext context, {
    required String icon,
    required String label,
  }) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(icon, width: 14.w, height: 14.h, color: Colors.grey.shade500),
      SizedBox(width: 4.w),
      Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: Colors.grey.shade500,
        ),
      ),
    ],
  );

  String _getLocalizedOfferType(BuildContext context, String offerType) {
    switch (offerType.toLowerCase()) {
      case 'sale':
        return context.l10n.buy; // Map 'sale' to 'Buy/بيع'
      case 'rent':
        return context.l10n.rent; // Map 'rent' to 'Rent/إيجار'
      default:
        return offerType;
    }
  }
}
