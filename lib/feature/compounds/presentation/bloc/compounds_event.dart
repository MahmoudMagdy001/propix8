import 'package:freezed_annotation/freezed_annotation.dart';

part 'compounds_event.freezed.dart';

@freezed
abstract class CompoundsEvent with _$CompoundsEvent {
  const factory CompoundsEvent.compoundsRequested() = CompoundsRequested;
  const factory CompoundsEvent.refreshed() = CompoundsRefreshed;
}
