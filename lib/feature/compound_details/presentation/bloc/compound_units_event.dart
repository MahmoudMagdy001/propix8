import 'package:freezed_annotation/freezed_annotation.dart';

part 'compound_units_event.freezed.dart';

@freezed
abstract class CompoundUnitsEvent with _$CompoundUnitsEvent {
  const factory CompoundUnitsEvent.compoundUnitsRequested(int id) =
      CompoundUnitsRequested;
  const factory CompoundUnitsEvent.compoundUnitsMoreRequested(int id) =
      CompoundUnitsMoreRequested;
  const factory CompoundUnitsEvent.compoundUnitsViewTypeToggled() =
      CompoundUnitsViewTypeToggled;
}
