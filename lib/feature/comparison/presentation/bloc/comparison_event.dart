import 'package:freezed_annotation/freezed_annotation.dart';

part 'comparison_event.freezed.dart';

@freezed
abstract class ComparisonEvent with _$ComparisonEvent {
  const factory ComparisonEvent.comparisonRequested({
    required int baseUnitId,
    required int selectedUnitId,
    required String Function(String) getLocalizedLabel,
    required String Function(String, String) getLocalizedValue,
    required String meterSquared,
    required String currencySymbol,
  }) = ComparisonRequested;
}
