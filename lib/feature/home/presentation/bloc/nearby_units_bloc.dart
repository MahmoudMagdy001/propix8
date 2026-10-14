import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/home/domain/usecases/get_nearby_units_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/toggle_favorite_usecase.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/home/presentation/bloc/nearby_units_event.dart';
import 'package:propix8/feature/home/presentation/bloc/nearby_units_state.dart';

class NearbyUnitsBloc extends SafeBloc<NearbyUnitsEvent, NearbyUnitsState> {
  NearbyUnitsBloc({
    required GetNearbyUnitsUseCase getNearbyUnitsUseCase,
    required ToggleFavoriteUseCase toggleFavoriteUseCase,
  })  : _getNearbyUnitsUseCase = getNearbyUnitsUseCase,
        _toggleFavoriteUseCase = toggleFavoriteUseCase,
        super(const NearbyUnitsState()) {
    on<NearbyUnitsRequested>(_onUnitsRequested);
    on<NearbyUnitsMoreUnitsRequested>(_onMoreUnitsRequested);
    on<NearbyUnitsViewTypeToggled>(_onViewTypeToggled);
    on<NearbyUnitsFavoriteToggled>(_onFavoriteToggled);
    on<NearbyUnitsRefreshed>(_onRefreshed);
  }

  final GetNearbyUnitsUseCase _getNearbyUnitsUseCase;
  final ToggleFavoriteUseCase _toggleFavoriteUseCase;

  Future<void> _onUnitsRequested(
    NearbyUnitsRequested event,
    Emitter<NearbyUnitsState> emit,
  ) async {
    emit(state.copyWith(status: HomeRequestStatus.loading));
    final result = await _getNearbyUnitsUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeRequestStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) => emit(
        state.copyWith(
          status: HomeRequestStatus.success,
          units: response.data,
          pagination: response.pagination,
        ),
      ),
    );
  }

  Future<void> _onMoreUnitsRequested(
    NearbyUnitsMoreUnitsRequested event,
    Emitter<NearbyUnitsState> emit,
  ) async {
    if (state.isLoadingMore ||
        state.pagination == null ||
        !state.pagination!.hasMorePages ||
        state.status == HomeRequestStatus.loading) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));
    final nextPage = state.pagination!.currentPage + 1;
    final result = await _getNearbyUnitsUseCase(page: nextPage);
    result.fold(
      (_) => emit(state.copyWith(isLoadingMore: false)),
      (response) => emit(
        state.copyWith(
          isLoadingMore: false,
          units: [...state.units, ...response.data],
          pagination: response.pagination,
        ),
      ),
    );
  }

  void _onViewTypeToggled(
    NearbyUnitsViewTypeToggled event,
    Emitter<NearbyUnitsState> emit,
  ) {
    final nextType =
        state.viewType == ViewType.grid ? ViewType.list : ViewType.grid;
    emit(state.copyWith(viewType: nextType));
  }

  Future<void> _onFavoriteToggled(
    NearbyUnitsFavoriteToggled event,
    Emitter<NearbyUnitsState> emit,
  ) async {
    final updatedUnits = state.units.map((unit) {
      if (unit.id == event.unitId) {
        final currentFav = unit.isFavorite ?? false;
        return unit.copyWithUnit(isFavorite: !currentFav);
      }
      return unit;
    }).toList();

    emit(state.copyWith(units: updatedUnits));
    final result = await _toggleFavoriteUseCase(event.unitId);
    result.fold(
      (_) {
        final rolledBack = state.units.map((unit) {
          if (unit.id == event.unitId) {
            final currentFav = unit.isFavorite ?? false;
            return unit.copyWithUnit(isFavorite: !currentFav);
          }
          return unit;
        }).toList();
        emit(state.copyWith(units: rolledBack));
      },
      (isFav) {
        final synced = state.units.map((unit) {
          if (unit.id == event.unitId) {
            return unit.copyWithUnit(isFavorite: isFav);
          }
          return unit;
        }).toList();
        emit(state.copyWith(units: synced));
      },
    );
  }

  void _onRefreshed(
    NearbyUnitsRefreshed event,
    Emitter<NearbyUnitsState> emit,
  ) {
    add(const NearbyUnitsEvent.unitsRequested());
  }
}
