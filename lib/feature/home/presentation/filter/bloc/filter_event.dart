import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_state.dart';

part 'filter_event.freezed.dart';

@freezed
abstract class FilterEvent with _$FilterEvent {
  const factory FilterEvent.citiesRequested() = FilterCitiesRequested;

  const factory FilterEvent.citySelected(int? cityId) = FilterCitySelected;

  const factory FilterEvent.tabChanged(PropertyTab? tab) = FilterTabChanged;

  const factory FilterEvent.developmentStatusChanged(
    DevelopmentStatus? status,
  ) = FilterDevelopmentStatusChanged;

  const factory FilterEvent.locationUpdated(String location) =
      FilterLocationUpdated;

  const factory FilterEvent.priceRangeUpdated(double min, double max) =
      FilterPriceRangeUpdated;

  const factory FilterEvent.bedroomsUpdated(int count) = FilterBedroomsUpdated;

  const factory FilterEvent.bathroomsUpdated(int count) =
      FilterBathroomsUpdated;

  const factory FilterEvent.roomsUpdated(int count) = FilterRoomsUpdated;

  const factory FilterEvent.areaRangeUpdated(double min, double max) =
      FilterAreaRangeUpdated;

  const factory FilterEvent.reset() = FilterReset;
}
