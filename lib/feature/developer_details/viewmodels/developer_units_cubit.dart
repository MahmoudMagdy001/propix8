import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/developer_details/models/developer_collection_model.dart';
import 'package:propix8/feature/developer_details/repositories/developer_repository.dart';
import 'package:propix8/feature/developer_details/viewmodels/developer_units_state.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';

class DeveloperUnitsCubit extends Cubit<DeveloperUnitsState> {
  DeveloperUnitsCubit(this._developerRepository)
    : super(const DeveloperUnitsState());
  final DeveloperRepository _developerRepository;

  Future<void> loadDeveloperUnits(int id) async {
    emit(state.copyWith(status: HomeRequestStatus.loading));
    try {
      final developer = await _developerRepository.getDeveloperUnits(
        id,
        page: 1,
      );
      if (isClosed) return;
      emit(
        state.copyWith(status: HomeRequestStatus.success, developer: developer),
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
    final pagination = state.developer?.pagination;
    if (state.isLoadingMore ||
        pagination == null ||
        !pagination.hasMorePages ||
        state.status == HomeRequestStatus.loading) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));
    try {
      final nextPage = pagination.currentPage + 1;
      final newDeveloper = await _developerRepository.getDeveloperUnits(
        id,
        page: nextPage,
      );

      if (isClosed) return;

      final updatedUnits = [...state.developer!.units, ...newDeveloper.units];

      emit(
        state.copyWith(
          isLoadingMore: false,
          developer: DeveloperCollectionModel(
            id: state.developer!.id,
            name: state.developer!.name,
            description: state.developer!.description,
            logo: state.developer!.logo,
            email: state.developer!.email,
            phone: state.developer!.phone,
            address: state.developer!.address,
            units: updatedUnits,
            pagination: newDeveloper.pagination,
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
