import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';

class UnitMapView extends StatefulWidget {
  const UnitMapView({
    required this.latitude,
    required this.longitude,
    required this.title,
    super.key,
  });

  final double latitude;
  final double longitude;
  final String title;

  @override
  State<UnitMapView> createState() => _UnitMapViewState();
}

class _UnitMapViewState extends State<UnitMapView>
    with TickerProviderStateMixin {
  late final MapController _mapController;
  double _currentZoom = 15.0;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    final latTween = Tween<double>(
      begin: _mapController.camera.center.latitude,
      end: destLocation.latitude,
    );
    final lngTween = Tween<double>(
      begin: _mapController.camera.center.longitude,
      end: destLocation.longitude,
    );
    final zoomTween = Tween<double>(
      begin: _mapController.camera.zoom,
      end: destZoom,
    );

    final controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    final animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );

    controller.addListener(() {
      _mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colorScheme;
    final unitLocation = LatLng(widget.latitude, widget.longitude);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: const CustomBackButton(),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: unitLocation,
              initialZoom: _currentZoom,
              onPositionChanged: (position, hasGesture) {
                if (hasGesture) {
                  _currentZoom = position.zoom;
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.propix8.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: unitLocation,
                    width: 45.w,
                    height: 45.h,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.elasticOut,
                      builder: (context, value, child) => Transform.scale(
                        scale: value,
                        child: Icon(
                          Icons.location_on,
                          color: colors.primary,
                          size: 45.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Control Buttons
          Positioned(
            right: 16.w,
            bottom: 32.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _MapControlButton(
                  icon: Icons.add,
                  onPressed: () {
                    _currentZoom += 1;
                    _animatedMapMove(
                      _mapController.camera.center,
                      _currentZoom,
                    );
                  },
                ),
                SizedBox(height: 8.h),
                _MapControlButton(
                  icon: Icons.remove,
                  onPressed: () {
                    _currentZoom -= 1;
                    _animatedMapMove(
                      _mapController.camera.center,
                      _currentZoom,
                    );
                  },
                ),
                SizedBox(height: 16.h),
                _MapControlButton(
                  icon: Icons.my_location,
                  onPressed: () {
                    _currentZoom = 15.0;
                    _animatedMapMove(unitLocation, _currentZoom);
                  },
                  backgroundColor: colors.primary,
                  iconColor: colors.onPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MapControlButton extends StatelessWidget {
  const _MapControlButton({
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Icon(icon, color: iconColor ?? colors.primary, size: 24.sp),
          ),
        ),
      ),
    );
  }
}
