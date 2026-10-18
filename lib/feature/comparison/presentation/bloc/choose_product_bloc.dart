import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/comparison/presentation/bloc/choose_product_event.dart';
import 'package:propix8/feature/comparison/presentation/bloc/choose_product_state.dart';
import 'package:propix8/feature/home/domain/usecases/get_all_units_usecase.dart';

class ChooseProductBloc
    extends SafeBloc<ChooseProductEvent, ChooseProductState> {
  ChooseProductBloc({required GetAllUnitsUseCase getAllUnitsUseCase})
    : _getAllUnitsUseCase = getAllUnitsUseCase,
      super(const ChooseProductState()) {
    on<ChooseProductUnitsLoaded>(_onUnitsLoaded);
    on<ChooseProductMoreUnitsLoaded>(_onMoreUnitsLoaded);
    on<ChooseProductViewTypeToggled>(_onViewTypeToggled);
  }

  final GetAllUnitsUseCase _getAllUnitsUseCase;

  Future<void> _onUnitsLoaded(
    ChooseProductUnitsLoaded event,
    Emitter<ChooseProductState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ChooseProductStatus.loading,
        units: event.isRefresh ? [] : state.units,
        currentPage: 1,
      ),
    );

    final result = await _getAllUnitsUseCase();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ChooseProductStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) {
        final filteredUnits = response.data
            .where((u) => u.id != event.excludeId)
            .toList();
        emit(
          state.copyWith(
            status: ChooseProductStatus.success,
            units: filteredUnits,
            lastPage: response.pagination.lastPage,
          ),
        );
      },
    );
  }

  Future<void> _onMoreUnitsLoaded(
    ChooseProductMoreUnitsLoaded event,
    Emitter<ChooseProductState> emit,
  ) async {
    if (state.status == ChooseProductStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(status: ChooseProductStatus.loading));

    final nextPage = state.currentPage + 1;
    final result = await _getAllUnitsUseCase(page: nextPage);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ChooseProductStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) {
        final filteredUnits = response.data
            .where((u) => u.id != event.excludeId)
            .toList();
        emit(
          state.copyWith(
            status: ChooseProductStatus.success,
            units: [...state.units, ...filteredUnits],
            currentPage: nextPage,
            lastPage: response.pagination.lastPage,
          ),
        );
      },
    );
  }

  void _onViewTypeToggled(
    ChooseProductViewTypeToggled event,
    Emitter<ChooseProductState> emit,
  ) {
    emit(
      state.copyWith(
        viewType: state.viewType == ViewType.grid
            ? ViewType.list
            : ViewType.grid,
      ),
    );
  }
}
