import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/comparison/models/comparison_model.dart';
import 'package:propix8/feature/comparison/viewmodels/comparison_state.dart';
import 'package:propix8/feature/unit_details/repositories/unit_details_repository.dart';

class ComparisonCubit extends SafeCubit<ComparisonState> {
  ComparisonCubit(this._repository) : super(const ComparisonState());

  final UnitDetailsRepository _repository;

  Future<void> loadComparison({
    required int baseUnitId,
    required int selectedUnitId,
    required String Function(String) getLocalizedLabel,
    required String Function(String, String) getLocalizedValue,
    required String meterSquared,
    required String currencySymbol,
  }) async {
    emit(state.copyWith(status: ComparisonStatus.loading));

    try {
      // Load both units in parallel
      final results = await Future.wait([
        _repository.getUnitDetails(baseUnitId),
        _repository.getUnitDetails(selectedUnitId),
      ]);

      if (isClosed) return;

      final baseUnit = results[0];
      final selectedUnit = results[1];

      // Generate comparison items
      final comparisonItems = ComparisonHelper.generateComparisonItems(
        baseUnit: baseUnit,
        selectedUnit: selectedUnit,
        getLocalizedLabel: getLocalizedLabel,
        getLocalizedValue: getLocalizedValue,
        meterSquared: meterSquared,
        currencySymbol: currencySymbol,
      );

      emit(
        state.copyWith(
          status: ComparisonStatus.success,
          baseUnit: baseUnit,
          selectedUnit: selectedUnit,
          comparisonItems: comparisonItems,
        ),
      );
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: ComparisonStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
