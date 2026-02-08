import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../repositories/unit_repository.dart';
import 'home_state.dart' show HomeRequestStatus;
import 'nearby_units_state.dart';

class NearbyUnitsCubit extends Cubit<NearbyUnitsState> {
  NearbyUnitsCubit(this._unitRepository) : super(const NearbyUnitsState());

  final UnitRepository _unitRepository;

  Future<void> loadNearbyUnits() async {
    emit(state.copyWith(status: HomeRequestStatus.loading));
    try {
      final response = await _unitRepository.getNearbyUnits();
      if (isClosed) return;
      emit(
        state.copyWith(
          status: HomeRequestStatus.success,
          units: response.units,
          pagination: response.pagination,
        ),
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

  Future<void> loadMoreUnits() async {
    if (state.isLoadingMore ||
        state.pagination == null ||
        !state.pagination!.hasMorePages ||
        state.status == HomeRequestStatus.loading) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));
    try {
      final nextPage = state.pagination!.currentPage + 1;
      final response = await _unitRepository.getNearbyUnits(page: nextPage);
      if (isClosed) return;

      emit(
        state.copyWith(
          isLoadingMore: false,
          units: [...state.units, ...response.units],
          pagination: response.pagination,
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
