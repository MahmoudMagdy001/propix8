import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

import '../models/city_model.dart';

enum AddressSetupStatus {
  initial,
  loading,
  citiesLoaded,
  submitting,
  success,
  failure,
}

class AddressSetupState extends Equatable {
  const AddressSetupState({
    this.status = AddressSetupStatus.initial,
    this.cities = const [],
    this.selectedCityId,
    this.selectedLocation,
    this.address = '',
    this.errorMessage,
  });
  final AddressSetupStatus status;
  final List<City> cities;
  final int? selectedCityId;
  final LatLng? selectedLocation;
  final String address;
  final String? errorMessage;

  AddressSetupState copyWith({
    AddressSetupStatus? status,
    List<City>? cities,
    int? selectedCityId,
    LatLng? selectedLocation,
    String? address,
    String? errorMessage,
  }) => AddressSetupState(
    status: status ?? this.status,
    cities: cities ?? this.cities,
    selectedCityId: selectedCityId ?? this.selectedCityId,
    selectedLocation: selectedLocation ?? this.selectedLocation,
    address: address ?? this.address,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [
    status,
    cities,
    selectedCityId,
    selectedLocation,
    address,
    errorMessage,
  ];
}
