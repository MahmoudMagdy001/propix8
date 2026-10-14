import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/comparison/domain/entities/comparison_item.dart';
import 'package:propix8/feature/comparison/domain/usecases/compare_units_usecase.dart';
import 'package:propix8/feature/comparison/presentation/bloc/comparison_event.dart';
import 'package:propix8/feature/comparison/presentation/bloc/comparison_state.dart';

class ComparisonBloc extends SafeBloc<ComparisonEvent, ComparisonState> {
  ComparisonBloc({required CompareUnitsUseCase compareUnitsUseCase})
    : _compareUnitsUseCase = compareUnitsUseCase,
      super(const ComparisonState()) {
    on<ComparisonRequested>(_onComparisonRequested);
  }

  final CompareUnitsUseCase _compareUnitsUseCase;

  Future<void> _onComparisonRequested(
    ComparisonRequested event,
    Emitter<ComparisonState> emit,
  ) async {
    emit(state.copyWith(status: ComparisonStatus.loading));

    final result = await _compareUnitsUseCase(
      baseUnitId: event.baseUnitId,
      selectedUnitId: event.selectedUnitId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ComparisonStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (units) {
        final (baseUnit, selectedUnit) = units;
        final comparisonItems = ComparisonHelper.generateComparisonItems(
          baseUnit: baseUnit,
          selectedUnit: selectedUnit,
          getLocalizedLabel: event.getLocalizedLabel,
          getLocalizedValue: event.getLocalizedValue,
          meterSquared: event.meterSquared,
          currencySymbol: event.currencySymbol,
        );

        emit(
          state.copyWith(
            status: ComparisonStatus.success,
            baseUnit: baseUnit,
            selectedUnit: selectedUnit,
            comparisonItems: comparisonItems,
          ),
        );
      },
    );
  }
}
