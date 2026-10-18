import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/auth/data/models/city_model.dart';

part 'filter_state.freezed.dart';

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

@freezed
abstract class FilterState with _$FilterState {
  const FilterState._();

  const factory FilterState({
    @Default(FilterStatus.initial) FilterStatus status,
    PropertyTab? activeTab,
    DevelopmentStatus? developmentStatus,
    String? location,
    int? selectedCityId,
    @Default(0.0) double minPrice,
    @Default(1000000.0) double maxPrice,
    @Default(0) int bedrooms,
    @Default(0) int bathrooms,
    @Default(0) int rooms,
    @Default(0.0) double minArea,
    @Default(1000.0) double maxArea,
    @Default([]) List<City> cities,
    String? errorMessage,
  }) = _FilterState;
}
