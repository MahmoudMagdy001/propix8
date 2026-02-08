import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/di/locator.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../../../l10n/app_localizations.dart';
import '../models/city_model.dart';
import '../viewmodels/address_setup_cubit.dart';
import '../viewmodels/address_setup_state.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;
    final colors = theme.colorScheme;

    return BlocProvider(
      create: (context) => locator<AddressSetupCubit>()
        ..fetchCities()
        ..detectCurrentLocation(),
      child: BlocConsumer<AddressSetupCubit, ProfileState>(
        listener: (context, state) {
          if (!ModalRoute.of(context)!.isCurrent) return;

          if (state.selectedLocation != null) {
            _mapController.move(state.selectedLocation!, 13.0);
          }

          if (state.status == ProfileStatus.success) {
            context.showSuccessSnackbar(l10n.profileUpdateSuccess);
            context.goNamed(AppRoutes.layout);
          } else if (state.status == ProfileStatus.failure) {
            context.showErrorSnackbar(
              state.errorMessage ?? l10n.profileUpdateError,
            );
          }
        },
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(child: _buildMap(context, state)),

                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10.h,
                      left: 16.w,
                      right: 16.w,
                      child: _buildCityDropdown(context, state, l10n),
                    ),

                    if (state.address.isNotEmpty)
                      Positioned(
                        bottom: 16.h,
                        left: 16.w,
                        right: 16.w,
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: colors.surface,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: colors.shadow.withValues(alpha: 0.15),
                                blurRadius: 10,
                                offset: const Offset(0, -4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: colors.primary,
                                size: 20.sp,
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  state.address == '...'
                                      ? l10n.loading
                                      : state.address,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: colors.onSurface,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 16.h,
                  bottom: MediaQuery.of(context).padding.bottom + 16.h,
                ),
                decoration: BoxDecoration(
                  color: colors.surface,
                  boxShadow: [
                    BoxShadow(
                      color: colors.shadow.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 54.h),
                  ),
                  onPressed:
                      state.status == ProfileStatus.submitting ||
                          state.selectedCityId == null ||
                          state.selectedLocation == null
                      ? null
                      : () => context.read<AddressSetupCubit>().submitProfile(),
                  child: state.status == ProfileStatus.submitting
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: colors.onPrimary,
                          ),
                        )
                      : Text(l10n.submitProfile),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCityDropdown(
    BuildContext context,
    ProfileState state,
    AppLocalizations l10n,
  ) {
    final colors = context.theme.colorScheme;

    if (state.status == ProfileStatus.loading) {
      return SizedBox(
        height: 50.h,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<int>(
        decoration: InputDecoration(
          filled: true,
          fillColor: colors.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: colors.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: colors.outline),
          ),
          hintText: l10n.selectCity,
          hintStyle: context.textTheme.bodyMedium?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        dropdownColor: colors.surface,
        initialValue: state.selectedCityId,
        items: state.cities
            .map(
              (City city) =>
                  DropdownMenuItem<int>(value: city.id, child: Text(city.name)),
            )
            .toList(),
        onChanged: (value) {
          if (value != null) {
            context.read<AddressSetupCubit>().selectCity(value);
          }
        },
      ),
    );
  }

  Widget _buildMap(BuildContext context, ProfileState state) {
    final colors = context.theme.colorScheme;

    final initialCenter =
        state.selectedLocation ?? const LatLng(30.0444, 31.2357);

    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: initialCenter,
        onTap: (_, point) {
          context.read<AddressSetupCubit>().updateLocation(point);
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.propix8.app',
        ),
        if (state.selectedLocation != null)
          MarkerLayer(
            markers: [
              Marker(
                point: state.selectedLocation!,
                width: 40.w,
                height: 40.h,
                child: Icon(
                  Icons.location_on,
                  color: colors.primary,
                  size: 36.sp,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
