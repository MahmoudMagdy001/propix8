import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home/models/unit_model.dart';
import '../router/app_routes.dart';
import '../utils/context_extensions.dart';
import '../utils/responsive_helper.dart';
import 'favorite_button.dart';

class UnitGridCard extends StatelessWidget {
  const UnitGridCard({required this.unit, super.key});
  final UnitModel unit;

  @override
  Widget build(BuildContext context) => Material(
    color: context.theme.cardTheme.color,
    borderRadius: BorderRadius.circular(12.r),
    child: InkWell(
      borderRadius: BorderRadius.circular(12.r),
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
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: unit.imageUrl ?? '',
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    memCacheHeight: 120 * 2,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: FavoriteButton(
                    unit: unit,
                    isFavorite: unit.isFavorite ?? false,
                    size: 20.sp,
                    color: Colors.white,
                  ),
                ),
                if (unit.offerType != null)
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(12.r),
                          topEnd: Radius.circular(12.r),
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
          ),

          // Content Section
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    unit.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      // color: context.theme.primaryColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // Address
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 10.sp,
                        color: Colors.grey.shade500,
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: Text(
                          unit.address ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: context.textTheme.labelSmall?.copyWith(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Features Row
                  FittedBox(
                    child: Row(
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
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          ),
        ],
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
        return context.l10n.buy;
      case 'rent':
        return context.l10n.rent;
      default:
        return offerType;
    }
  }
}
