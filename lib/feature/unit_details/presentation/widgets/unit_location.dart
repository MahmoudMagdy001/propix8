import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/section_header.dart';
import 'package:visibility_detector/visibility_detector.dart';

class UnitLocation extends StatefulWidget {
  const UnitLocation({super.key});

  @override
  State<UnitLocation> createState() => _UnitLocationState();
}

class _UnitLocationState extends State<UnitLocation> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        UnitDetailsBloc,
        UnitDetailsState,
        ({String latitude, String longitude, String title})?
      >(
        selector: (state) {
          if (state.unit == null) return null;
          if (state.unit!.latitude.isEmpty || state.unit!.longitude.isEmpty) {
            return null;
          }
          return (
            latitude: state.unit!.latitude,
            longitude: state.unit!.longitude,
            title: state.unit!.title,
          );
        },
        builder: (context, data) {
          if (data == null) return const SliverToBoxAdapter(child: SizedBox());
          final lat = double.tryParse(data.latitude) ?? 0.0;
          final lng = double.tryParse(data.longitude) ?? 0.0;

          return SliverToBoxAdapter(
            child: VisibilityDetector(
              key: const Key('unit-location-map'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.1 && !_isVisible) {
                  setState(() {
                    _isVisible = true;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: context.l10n.location),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Container(
                      height: 180.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: context.colorScheme.outlineVariant
                              .withValues(alpha: 0.5),
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: [
                          if (_isVisible)
                            FlutterMap(
                              options: MapOptions(
                                initialCenter: LatLng(lat, lng),
                                initialZoom: 15.0,
                                interactionOptions: const InteractionOptions(
                                  flags: InteractiveFlag.none,
                                ),
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  userAgentPackageName:
                                      'com.propix.propix_portal',
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: LatLng(lat, lng),
                                      width: 40.w,
                                      height: 40.h,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: context.colorScheme.primary,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: context
                                                  .colorScheme.primary
                                                  .withValues(alpha: 0.3),
                                              blurRadius: 8,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.location_on,
                                          color:
                                              context.colorScheme.onPrimary,
                                          size: 24.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          else
                            ColoredBox(
                              color: context.colorScheme.surfaceContainerHighest
                                  .withValues(alpha: 0.3),
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: context.colorScheme.primary,
                                ),
                              ),
                            ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                unawaited(
                                  context.pushNamed(
                                    AppRoutes.propertyMap,
                                    extra: {
                                      'latitude': lat,
                                      'longitude': lng,
                                      'title': data.title,
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 12.h,
                            left: 12.w,
                            right: 12.w,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: context.colorScheme.surface
                                    .withValues(alpha: 0.95),
                                borderRadius: BorderRadius.circular(8.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.fullscreen,
                                    size: 16.sp,
                                    color: context.colorScheme.primary,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    context.l10n.mapLocation,
                                    style: context.textTheme.labelMedium
                                        ?.copyWith(
                                      color: context.colorScheme.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
