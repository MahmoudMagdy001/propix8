import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer_units_event.freezed.dart';

@freezed
abstract class DeveloperUnitsEvent with _$DeveloperUnitsEvent {
  const factory DeveloperUnitsEvent.developerUnitsRequested(int id) =
      DeveloperUnitsRequested;
  const factory DeveloperUnitsEvent.developerUnitsMoreRequested(int id) =
      DeveloperUnitsMoreRequested;
  const factory DeveloperUnitsEvent.developerUnitsViewTypeToggled() =
      DeveloperUnitsViewTypeToggled;
}
