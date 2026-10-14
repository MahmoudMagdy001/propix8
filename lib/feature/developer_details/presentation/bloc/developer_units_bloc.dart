import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/developer_details/domain/entities/developer_collection_entity.dart';
import 'package:propix8/feature/developer_details/domain/usecases/get_developer_units_usecase.dart';
import 'package:propix8/feature/developer_details/presentation/bloc/developer_units_event.dart';
import 'package:propix8/feature/developer_details/presentation/bloc/developer_units_state.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';

class DeveloperUnitsBloc
    extends SafeBloc<DeveloperUnitsEvent, DeveloperUnitsState> {
  DeveloperUnitsBloc({
    required GetDeveloperUnitsUseCase getDeveloperUnitsUseCase,
  })  : _getDeveloperUnitsUseCase = getDeveloperUnitsUseCase,
        super(const DeveloperUnitsState()) {
    on<DeveloperUnitsRequested>(_onDeveloperUnitsRequested);
    on<DeveloperUnitsMoreRequested>(_onDeveloperUnitsMoreRequested);
    on<DeveloperUnitsViewTypeToggled>(_onDeveloperUnitsViewTypeToggled);
  }

  final GetDeveloperUnitsUseCase _getDeveloperUnitsUseCase;

  Future<void> _onDeveloperUnitsRequested(
    DeveloperUnitsRequested event,
    Emitter<DeveloperUnitsState> emit,
  ) async {
    emit(state.copyWith(status: HomeRequestStatus.loading));
    final result = await _getDeveloperUnitsUseCase(event.id, page: 1);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeRequestStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (developer) => emit(
        state.copyWith(
          status: HomeRequestStatus.success,
          developer: developer,
        ),
      ),
    );
  }

  Future<void> _onDeveloperUnitsMoreRequested(
    DeveloperUnitsMoreRequested event,
    Emitter<DeveloperUnitsState> emit,
  ) async {
    final pagination = state.developer?.pagination;
    if (state.isLoadingMore ||
        pagination == null ||
        !pagination.hasMorePages ||
        state.status == HomeRequestStatus.loading) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));
    final nextPage = pagination.currentPage + 1;
    final result = await _getDeveloperUnitsUseCase(event.id, page: nextPage);

    result.fold(
      (failure) => emit(state.copyWith(isLoadingMore: false)),
      (newDeveloper) {
        final updatedUnits = [
          ...state.developer!.units,
          ...newDeveloper.units,
        ];

        emit(
          state.copyWith(
            isLoadingMore: false,
            developer: DeveloperCollectionEntity(
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
      },
    );
  }

  void _onDeveloperUnitsViewTypeToggled(
    DeveloperUnitsViewTypeToggled event,
    Emitter<DeveloperUnitsState> emit,
  ) {
    final nextType =
        state.viewType == ViewType.grid ? ViewType.list : ViewType.grid;
    emit(state.copyWith(viewType: nextType));
  }
}
