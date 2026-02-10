import 'package:equatable/equatable.dart';

import '../../../../auth/models/city_model.dart';

enum FilterStatus {
  initial,
  loading,
  success,
  failure,
  citiesLoading,
  citiesLoaded,
}

enum PropertyTab { buy, rent }

enum DevelopmentStatus { primary, resale }

class FilterState extends Equatable {
  const FilterState({
    this.status = FilterStatus.initial,
    this.activeTab,
    this.developmentStatus,
    this.location,
    this.selectedCityId,
    this.minPrice = 0,
    this.maxPrice = 1000000,
    this.bedrooms = 0,
    this.bathrooms = 0,
    this.rooms = 0,
    this.minArea = 0,
    this.maxArea = 1000,
    this.cities = const [],
    this.errorMessage,
  });
  final FilterStatus status;
  final PropertyTab? activeTab;
  final DevelopmentStatus? developmentStatus;
  final String? location;
  final int? selectedCityId;
  final double minPrice;
  final double maxPrice;
  final int bedrooms;
  final int bathrooms;
  final int rooms;
  final double minArea;
  final double maxArea;
  final List<City> cities;
  final String? errorMessage;

  FilterState copyWith({
    FilterStatus? status,
    PropertyTab? activeTab,
    bool clearActiveTab = false,
    DevelopmentStatus? developmentStatus,
    bool clearDevelopmentStatus = false,
    String? location,
    int? selectedCityId,
    double? minPrice,
    double? maxPrice,
    int? bedrooms,
    int? bathrooms,
    int? rooms,
    double? minArea,
    double? maxArea,
    List<City>? cities,
    String? errorMessage,
  }) => FilterState(
    status: status ?? this.status,
    activeTab: clearActiveTab ? null : (activeTab ?? this.activeTab),
    developmentStatus: clearDevelopmentStatus
        ? null
        : (developmentStatus ?? this.developmentStatus),
    location: location ?? this.location,
    selectedCityId: selectedCityId ?? this.selectedCityId,
    minPrice: minPrice ?? this.minPrice,
    maxPrice: maxPrice ?? this.maxPrice,
    bedrooms: bedrooms ?? this.bedrooms,
    bathrooms: bathrooms ?? this.bathrooms,
    rooms: rooms ?? this.rooms,
    minArea: minArea ?? this.minArea,
    maxArea: maxArea ?? this.maxArea,
    cities: cities ?? this.cities,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [
    status,
    activeTab,
    developmentStatus,
    location,
    selectedCityId,
    minPrice,
    maxPrice,
    bedrooms,
    bathrooms,
    rooms,
    minArea,
    maxArea,
    cities,
    errorMessage,
  ];
}
