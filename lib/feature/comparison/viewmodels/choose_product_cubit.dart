import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/comparison/viewmodels/choose_product_state.dart';
import 'package:propix8/feature/home/repositories/unit_repository.dart';

class ChooseProductCubit extends Cubit<ChooseProductState> {
  ChooseProductCubit(this._unitRepository) : super(const ChooseProductState());

  final UnitRepository _unitRepository;

  Future<void> loadUnits({
    required int excludeId,
    bool isRefresh = false,
  }) async {
    emit(
      state.copyWith(
        status: ChooseProductStatus.loading,
        units: isRefresh ? [] : state.units,
        currentPage: 1,
      ),
    );

    try {
      final response = await _unitRepository.getAllUnits();
      if (isClosed) return;
      final filteredUnits = response.units
          .where((u) => u.id != excludeId)
          .toList();

      emit(
        state.copyWith(
          status: ChooseProductStatus.success,
          units: filteredUnits,
          lastPage: response.pagination?.lastPage ?? 1,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ChooseProductStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> loadMoreUnits({required int excludeId}) async {
    if (state.status == ChooseProductStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(status: ChooseProductStatus.loading));

    try {
      final nextPage = state.currentPage + 1;
      final response = await _unitRepository.getAllUnits(page: nextPage);
      if (isClosed) return;
      final filteredUnits = response.units
          .where((u) => u.id != excludeId)
          .toList();

      emit(
        state.copyWith(
          status: ChooseProductStatus.success,
          units: [...state.units, ...filteredUnits],
          currentPage: nextPage,
          lastPage: response.pagination?.lastPage ?? state.lastPage,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ChooseProductStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void toggleViewType() {
    emit(
      state.copyWith(
        viewType: state.viewType == ViewType.grid
            ? ViewType.list
            : ViewType.grid,
      ),
    );
  }
}
