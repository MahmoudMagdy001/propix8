import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

import '../models/city_model.dart';

enum ProfileStatus {
  initial,
  loading,
  citiesLoaded,
  submitting,
  success,
  failure,
}

class ProfileState extends Equatable {
  const ProfileState({
    this.status = ProfileStatus.initial,
    this.cities = const [],
    this.selectedCityId,
    this.selectedLocation,
    this.address = '',
    this.errorMessage,
  });
  final ProfileStatus status;
  final List<City> cities;
  final int? selectedCityId;
  final LatLng? selectedLocation;
  final String address;
  final String? errorMessage;

  ProfileState copyWith({
    ProfileStatus? status,
    List<City>? cities,
    int? selectedCityId,
    LatLng? selectedLocation,
    String? address,
    String? errorMessage,
  }) => ProfileState(
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
