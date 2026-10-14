import 'package:freezed_annotation/freezed_annotation.dart';

part 'pages_event.freezed.dart';

@freezed
sealed class PagesEvent with _$PagesEvent {
  const factory PagesEvent.pagesRequested() = PagesRequested;
  const factory PagesEvent.statsRequested() = StatsRequested;
  const factory PagesEvent.allDataRequested() = PagesAllDataRequested;
}
