import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_cubit.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_state.dart';
import 'package:propix8/feature/unit_details/views/widgets/section_header.dart';
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
        UnitDetailsCubit,
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
                if (!mounted) return;
                if (info.visibleFraction > 0 && !_isVisible) {
                  setState(() {
                    _isVisible = true;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: context.l10n.mapLocation),
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 200.h,
                    child: _isVisible
                        ? Stack(
                            children: [
                              FlutterMap(
                                options: MapOptions(
                                  initialCenter: LatLng(lat, lng),
                                  interactionOptions: const InteractionOptions(
                                    flags: InteractiveFlag.none,
                                  ),
                                ),
                                children: [
                                  TileLayer(
                                    urlTemplate:
                                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    userAgentPackageName: 'com.propix8.app',
                                  ),
                                  MarkerLayer(
                                    markers: [
                                      Marker(
                                        point: LatLng(lat, lng),
                                        width: 40.w,
                                        height: 40.h,
                                        child: Icon(
                                          Icons.location_on,
                                          color: context.colorScheme.primary,
                                          size: 40.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.pushNamed(
                                    AppRoutes.propertyMap,
                                    extra: {
                                      'latitude': lat,
                                      'longitude': lng,
                                      'title': data.title,
                                    },
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.black.withValues(alpha: 0.1),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Text(
                                      context.l10n.tapToInteract,
                                      style: context.textTheme.bodySmall
                                          ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : DecoratedBox(
                            decoration: BoxDecoration(
                              color:
                                  context.colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(),
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
