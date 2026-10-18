import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'address_setup_event.freezed.dart';

@freezed
sealed class AddressSetupEvent with _$AddressSetupEvent {
  const factory AddressSetupEvent.citiesRequested() =
      AddressSetupCitiesRequested;

  const factory AddressSetupEvent.locationDetectionRequested() =
      AddressSetupLocationDetectionRequested;

  const factory AddressSetupEvent.citySelected(int cityId) =
      AddressSetupCitySelected;

  const factory AddressSetupEvent.locationUpdated(LatLng location) =
      AddressSetupLocationUpdated;

  const factory AddressSetupEvent.submitted() = AddressSetupSubmitted;
}
