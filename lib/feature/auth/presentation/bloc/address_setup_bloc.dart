import 'dart:async';
import 'dart:ui' show Locale;

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/auth/domain/repositories/address_setup_repository.dart';
import 'package:propix8/feature/auth/domain/usecases/get_cities_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/update_address_profile_usecase.dart';
import 'package:propix8/feature/auth/presentation/bloc/address_setup_event.dart';
import 'package:propix8/feature/auth/presentation/bloc/address_setup_state.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_event.dart';

class AddressSetupBloc
    extends SafeBloc<AddressSetupEvent, AddressSetupState> {
  AddressSetupBloc({
    required AuthBloc authBloc,
    AddressSetupRepository? addressSetupRepository,
    GetCitiesUseCase? getCitiesUseCase,
    UpdateAddressProfileUseCase? updateAddressProfileUseCase,
  })  : _authBloc = authBloc,
        _getCitiesUseCase =
            getCitiesUseCase ?? GetCitiesUseCase(addressSetupRepository!),
        _updateAddressProfileUseCase =
            updateAddressProfileUseCase ??
            UpdateAddressProfileUseCase(addressSetupRepository!),
        super(const AddressSetupState()) {
    on<AddressSetupCitiesRequested>(_onCitiesRequested);
    on<AddressSetupLocationDetectionRequested>(_onLocationDetectionRequested);
    on<AddressSetupCitySelected>(_onCitySelected);
    on<AddressSetupLocationUpdated>(_onLocationUpdated);
    on<AddressSetupSubmitted>(_onSubmitted);
  }

  final AuthBloc _authBloc;
  final GetCitiesUseCase _getCitiesUseCase;
  final UpdateAddressProfileUseCase _updateAddressProfileUseCase;

  Future<void> _onCitiesRequested(
    AddressSetupCitiesRequested event,
    Emitter<AddressSetupState> emit,
  ) async {
    emit(state.copyWith(status: AddressSetupStatus.loading));
    final result = await _getCitiesUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AddressSetupStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (cities) => emit(
        state.copyWith(
          status: AddressSetupStatus.citiesLoaded,
          cities: cities,
        ),
      ),
    );
  }

  Future<void> _onLocationDetectionRequested(
    AddressSetupLocationDetectionRequested event,
    Emitter<AddressSetupState> emit,
  ) async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(
        state.copyWith(
          status: AddressSetupStatus.failure,
          errorMessage: 'LOCATION_SERVICE_DISABLED',
        ),
      );
      return;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(
          state.copyWith(
            status: AddressSetupStatus.failure,
            errorMessage: 'LOCATION_PERMISSION_DENIED',
          ),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(
        state.copyWith(
          status: AddressSetupStatus.failure,
          errorMessage: 'LOCATION_PERMISSION_DENIED_FOREVER',
        ),
      );
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    add(AddressSetupLocationUpdated(
      LatLng(position.latitude, position.longitude),
    ));
  }

  void _onCitySelected(
    AddressSetupCitySelected event,
    Emitter<AddressSetupState> emit,
  ) {
    emit(state.copyWith(selectedCityId: event.cityId));
  }

  Future<void> _onLocationUpdated(
    AddressSetupLocationUpdated event,
    Emitter<AddressSetupState> emit,
  ) async {
    emit(state.copyWith(selectedLocation: event.location, address: '...'));

    try {
      final placemarks = await Geocoding().placemarkFromCoordinates(
        event.location.latitude,
        event.location.longitude,
        locale: const Locale('ar'),
      );

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
                '${event.location.latitude.toStringAsFixed(4)}, ${event.location.longitude.toStringAsFixed(4)}',
          ),
        );
      }
    } on Object catch (_) {
      emit(
        state.copyWith(
          address:
              '${event.location.latitude.toStringAsFixed(4)}, ${event.location.longitude.toStringAsFixed(4)}',
        ),
      );
    }
  }

  Future<void> _onSubmitted(
    AddressSetupSubmitted event,
    Emitter<AddressSetupState> emit,
  ) async {
    if (state.selectedCityId == null || state.selectedLocation == null) {
      emit(
        state.copyWith(
          status: AddressSetupStatus.failure,
          errorMessage: 'Please select a city and a location on the map.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: AddressSetupStatus.submitting));
    final result = await _updateAddressProfileUseCase(
      cityId: state.selectedCityId!,
      address: state.address,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AddressSetupStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (user) {
        _authBloc.add(AuthUserUpdated(user));
        emit(state.copyWith(status: AddressSetupStatus.success));
      },
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Convenience Async API
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> fetchCities() async {
    add(const AddressSetupCitiesRequested());
  }

  Future<void> detectCurrentLocation() async {
    add(const AddressSetupLocationDetectionRequested());
  }

  void selectCity(int cityId) {
    add(AddressSetupCitySelected(cityId));
  }

  Future<void> updateLocation(LatLng location) async {
    add(AddressSetupLocationUpdated(location));
  }

  Future<void> submitProfile() async {
    add(const AddressSetupSubmitted());
  }

  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }
}
