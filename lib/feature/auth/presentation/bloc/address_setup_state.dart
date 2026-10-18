import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:propix8/feature/auth/domain/entities/city_entity.dart';

part 'address_setup_state.freezed.dart';

enum AddressSetupStatus {
  initial,
  loading,
  citiesLoaded,
  submitting,
  success,
  failure,
}

@freezed
abstract class AddressSetupState with _$AddressSetupState {
  const AddressSetupState._();

  const factory AddressSetupState({
    @Default(AddressSetupStatus.initial) AddressSetupStatus status,
    @Default(<City>[]) List<City> cities,
    int? selectedCityId,
    LatLng? selectedLocation,
    @Default('') String address,
    String? errorMessage,
  }) = _AddressSetupState;
}
