import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_units_event.freezed.dart';

@freezed
abstract class NearbyUnitsEvent with _$NearbyUnitsEvent {
  const factory NearbyUnitsEvent.unitsRequested() = NearbyUnitsRequested;

  const factory NearbyUnitsEvent.moreUnitsRequested() =
      NearbyUnitsMoreUnitsRequested;

  const factory NearbyUnitsEvent.viewTypeToggled() = NearbyUnitsViewTypeToggled;

  const factory NearbyUnitsEvent.favoriteToggled(int unitId) =
      NearbyUnitsFavoriteToggled;

  const factory NearbyUnitsEvent.refreshed() = NearbyUnitsRefreshed;
}
