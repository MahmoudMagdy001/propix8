import 'package:equatable/equatable.dart';
import 'package:propix8/feature/comparison/models/comparison_model.dart';
import 'package:propix8/feature/unit_details/models/unit_details_model.dart';

enum ComparisonStatus { initial, loading, success, failure }

class ComparisonState extends Equatable {
  const ComparisonState({
    this.status = ComparisonStatus.initial,
    this.errorMessage,
    this.baseUnit,
    this.selectedUnit,
    this.comparisonItems = const [],
  });

  final ComparisonStatus status;
  final String? errorMessage;
  final UnitDetailsModel? baseUnit;
  final UnitDetailsModel? selectedUnit;
  final List<ComparisonItem> comparisonItems;

  ComparisonState copyWith({
    ComparisonStatus? status,
    String? errorMessage,
    UnitDetailsModel? baseUnit,
    UnitDetailsModel? selectedUnit,
    List<ComparisonItem>? comparisonItems,
  }) => ComparisonState(
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage,
    baseUnit: baseUnit ?? this.baseUnit,
    selectedUnit: selectedUnit ?? this.selectedUnit,
    comparisonItems: comparisonItems ?? this.comparisonItems,
  );

  @override
  List<Object?> get props => [
    status,
    errorMessage,
    baseUnit,
    selectedUnit,
    comparisonItems,
  ];
}
