import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/comparison/domain/entities/comparison_item.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';

part 'comparison_state.freezed.dart';

enum ComparisonStatus { initial, loading, success, failure }

@freezed
abstract class ComparisonState with _$ComparisonState {
  const factory ComparisonState({
    @Default(ComparisonStatus.initial) ComparisonStatus status,
    String? errorMessage,
    UnitDetailsEntity? baseUnit,
    UnitDetailsEntity? selectedUnit,
    @Default([]) List<ComparisonItem> comparisonItems,
  }) = _ComparisonState;
}
