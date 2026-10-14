import 'package:freezed_annotation/freezed_annotation.dart';

part 'developers_event.freezed.dart';

@freezed
abstract class DevelopersEvent with _$DevelopersEvent {
  const factory DevelopersEvent.developersRequested() = DevelopersRequested;
  const factory DevelopersEvent.refreshed() = DevelopersRefreshed;
}
