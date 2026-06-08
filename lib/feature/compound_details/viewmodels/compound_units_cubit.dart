import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/compound_details/models/compound_collection_model.dart';
import 'package:propix8/feature/compound_details/repositories/compound_repository.dart';
import 'package:propix8/feature/compound_details/viewmodels/compound_units_state.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';

class CompoundUnitsCubit extends Cubit<CompoundUnitsState> {
  CompoundUnitsCubit(this._compoundRepository)
    : super(const CompoundUnitsState());
  final CompoundRepository _compoundRepository;

  Future<void> loadCompoundUnits(int id) async {
    emit(state.copyWith(status: HomeRequestStatus.loading));
    try {
      final compound = await _compoundRepository.getCompoundUnits(id, page: 1);
      if (isClosed) return;
      emit(
        state.copyWith(status: HomeRequestStatus.success, compound: compound),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> loadMoreUnits(int id) async {
    final pagination = state.compound?.pagination;
    if (state.isLoadingMore ||
        pagination == null ||
        !pagination.hasMorePages ||
        state.status == HomeRequestStatus.loading) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));
    try {
      final nextPage = pagination.currentPage + 1;
      final newCompound = await _compoundRepository.getCompoundUnits(
        id,
        page: nextPage,
      );

      if (isClosed) return;

      final updatedUnits = [...state.compound!.units, ...newCompound.units];

      emit(
        state.copyWith(
          isLoadingMore: false,
          compound: CompoundCollectionModel(
            id: state.compound!.id,
            name: state.compound!.name,
            description: state.compound!.description,
            units: updatedUnits,
            pagination: newCompound.pagination,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false));
    }
  }

  void toggleViewType() {
    final nextType = state.viewType == ViewType.grid
        ? ViewType.list
        : ViewType.grid;
    emit(state.copyWith(viewType: nextType));
  }
}
