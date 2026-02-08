import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/di/locator.dart';
import '../../../viewmodels/auth_cubit.dart';
import '../repositories/address_setup_repository.dart';
import 'address_setup_state.dart';

class AddressSetupCubit extends Cubit<ProfileState> {
  AddressSetupCubit(this._addressSetupRepository) : super(const ProfileState());
  final AddressSetupRepository _addressSetupRepository;

  Future<void> fetchCities() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    final result = await _addressSetupRepository.getCities();
    if (isClosed) return;
    result.fold(
      (error) => emit(
        state.copyWith(status: ProfileStatus.failure, errorMessage: error),
      ),
      (cities) => emit(
        state.copyWith(status: ProfileStatus.citiesLoaded, cities: cities),
      ),
    );
  }

  Future<void> detectCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    final position = await Geolocator.getCurrentPosition();
    if (isClosed) return;

    updateLocation(LatLng(position.latitude, position.longitude));
  }

  void selectCity(int cityId) {
    emit(state.copyWith(selectedCityId: cityId));
  }

  Future<void> updateLocation(LatLng location) async {
    emit(state.copyWith(selectedLocation: location, address: '...'));

    try {
      await setLocaleIdentifier('ar');
      final placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (isClosed) return;

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        final address = [
          if (place.street != null && place.street!.isNotEmpty) place.street,
          if (place.subLocality != null && place.subLocality!.isNotEmpty)
            place.subLocality,
          if (place.locality != null && place.locality!.isNotEmpty)
            place.locality,
          if (place.administrativeArea != null &&
              place.administrativeArea!.isNotEmpty)
            place.administrativeArea,
          if (place.country != null && place.country!.isNotEmpty) place.country,
        ].join(', ');

        emit(state.copyWith(address: address));
      } else {
        emit(
          state.copyWith(
            address:
                '${location.latitude.toStringAsFixed(4)}, ${location.longitude.toStringAsFixed(4)}',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          address:
              '${location.latitude.toStringAsFixed(4)}, ${location.longitude.toStringAsFixed(4)}',
        ),
      );
    }
  }

  Future<void> submitProfile() async {
    if (state.selectedCityId == null || state.selectedLocation == null) {
      emit(
        state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: 'Please select a city and a location on the map.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: ProfileStatus.submitting));
    final result = await _addressSetupRepository.updateProfile(
      cityId: state.selectedCityId!,
      address: state.address,
    );
    if (isClosed) return;

    result.fold(
      (error) => emit(
        state.copyWith(status: ProfileStatus.failure, errorMessage: error),
      ),
      (user) {
        locator<AuthCubit>().updateUser(user);
        emit(state.copyWith(status: ProfileStatus.success));
      },
    );
  }
}
