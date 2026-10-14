import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/compound_details/domain/entities/compound_collection_entity.dart';
import 'package:propix8/feature/compound_details/domain/usecases/get_compound_units_usecase.dart';
import 'package:propix8/feature/compound_details/presentation/bloc/compound_units_event.dart';
import 'package:propix8/feature/compound_details/presentation/bloc/compound_units_state.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';

class CompoundUnitsBloc
    extends SafeBloc<CompoundUnitsEvent, CompoundUnitsState> {
  CompoundUnitsBloc({
    required GetCompoundUnitsUseCase getCompoundUnitsUseCase,
  })  : _getCompoundUnitsUseCase = getCompoundUnitsUseCase,
        super(const CompoundUnitsState()) {
    on<CompoundUnitsRequested>(_onCompoundUnitsRequested);
    on<CompoundUnitsMoreRequested>(_onCompoundUnitsMoreRequested);
    on<CompoundUnitsViewTypeToggled>(_onCompoundUnitsViewTypeToggled);
  }

  final GetCompoundUnitsUseCase _getCompoundUnitsUseCase;

  Future<void> _onCompoundUnitsRequested(
    CompoundUnitsRequested event,
    Emitter<CompoundUnitsState> emit,
  ) async {
    emit(state.copyWith(status: HomeRequestStatus.loading));
    final result = await _getCompoundUnitsUseCase(event.id, page: 1);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeRequestStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (compound) => emit(
        state.copyWith(
          status: HomeRequestStatus.success,
          compound: compound,
        ),
      ),
    );
  }

  Future<void> _onCompoundUnitsMoreRequested(
    CompoundUnitsMoreRequested event,
    Emitter<CompoundUnitsState> emit,
  ) async {
    final pagination = state.compound?.pagination;
    if (state.isLoadingMore ||
        pagination == null ||
        !pagination.hasMorePages ||
        state.status == HomeRequestStatus.loading) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));
    final nextPage = pagination.currentPage + 1;
    final result = await _getCompoundUnitsUseCase(event.id, page: nextPage);

    result.fold(
      (failure) => emit(state.copyWith(isLoadingMore: false)),
      (newCompound) {
        final updatedUnits = [
          ...state.compound!.units,
          ...newCompound.units,
        ];

        emit(
          state.copyWith(
            isLoadingMore: false,
            compound: CompoundCollectionEntity(
              id: state.compound!.id,
              name: state.compound!.name,
              description: state.compound!.description,
              units: updatedUnits,
              pagination: newCompound.pagination,
            ),
          ),
        );
      },
    );
  }

  void _onCompoundUnitsViewTypeToggled(
    CompoundUnitsViewTypeToggled event,
    Emitter<CompoundUnitsState> emit,
  ) {
    final nextType =
        state.viewType == ViewType.grid ? ViewType.list : ViewType.grid;
    emit(state.copyWith(viewType: nextType));
  }
}
