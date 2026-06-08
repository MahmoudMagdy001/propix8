import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/favorites/models/favorite_model.dart';
import 'package:propix8/feature/favorites/repositories/favorite_repository.dart';
import 'package:propix8/feature/favorites/viewmodels/favorite_state.dart';
import 'package:propix8/feature/home/models/unit_model.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this._favoriteRepository) : super(const FavoriteState());

  final FavoriteRepository _favoriteRepository;

  Future<void> getFavorites({
    bool isLoadMore = false,
    bool forceRefresh = false,
  }) async {
    // Skip fetch if data is already loaded (prevents refetch on tab switch)
    if (!isLoadMore &&
        !forceRefresh &&
        state.listStatus == FavoriteStatus.success &&
        state.favoriteUnits.isNotEmpty) {
      return;
    }
    if (isLoadMore && !state.hasMore) return;
    if (isLoadMore && state.listStatus == FavoriteStatus.loading) return;

    emit(
      state.copyWith(
        listStatus: FavoriteStatus.loading,
        currentPage: isLoadMore ? state.currentPage : 1,
        favoriteUnits: isLoadMore ? state.favoriteUnits : [],
      ),
    );

    try {
      final response = await _favoriteRepository.getFavorites(
        page: isLoadMore ? state.currentPage + 1 : 1,
      );

      if (isClosed) return;

      final units = isLoadMore
          ? [...state.favoriteUnits, ...response.data]
          : response.data;

      // Update the favorites map for ALL units in the list (not just new ones)
      final updatedFavorites = Map<int, bool>.from(state.favorites);
      for (final fav in units) {
        updatedFavorites[fav.unit.id] = true;
      }

      emit(
        state.copyWith(
          listStatus: FavoriteStatus.success,
          favoriteUnits: units,
          favorites: updatedFavorites,
          currentPage: response.pagination?.currentPage ?? 1,
          lastPage: response.pagination?.lastPage ?? 1,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          listStatus: FavoriteStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void updateFavoriteStatus(int unitId, bool isFavorite) {
    final updatedFavorites = Map<int, bool>.from(state.favorites);
    updatedFavorites[unitId] = isFavorite;
    emit(state.copyWith(favorites: updatedFavorites));
  }

  void initializeFavorites(Map<int, bool> initialFavorites) {
    final updatedFavorites = Map<int, bool>.from(state.favorites)
      ..addAll(initialFavorites);
    emit(state.copyWith(favorites: updatedFavorites));
  }

  Future<void> toggleFavorite(UnitModel unit) async {
    final unitId = unit.id;
    final isCurrentlyFavorite = state.favorites[unitId] ?? false;

    // Optimistic update for the favorites map (the icon)
    final optimisticFavorites = Map<int, bool>.from(state.favorites);
    optimisticFavorites[unitId] = !isCurrentlyFavorite;

    // Optimistic update for the favorites list (the view)
    final optimisticUnits = List<FavoriteUnitModel>.from(state.favoriteUnits);
    if (isCurrentlyFavorite) {
      // Remove immediately
      optimisticUnits.removeWhere((e) => e.unit.id == unitId);
    } else {
      // Add immediately as a placeholder
      optimisticUnits.insert(
        0,
        FavoriteUnitModel(
          id: -1, // Placeholder ID
          unit: unit,
          createdAt: DateTime.now(),
        ),
      );
    }

    emit(
      state.copyWith(
        favorites: optimisticFavorites,
        favoriteUnits: optimisticUnits,
        status: FavoriteStatus.loading,
      ),
    );

    try {
      final actualStatus = await _favoriteRepository.toggleFavorite(unitId);
      if (isClosed) return;

      final finalFavorites = Map<int, bool>.from(state.favorites);
      finalFavorites[unitId] = actualStatus;

      // Ensure the list is in sync with the actual server response
      final finalUnits = List<FavoriteUnitModel>.from(state.favoriteUnits);
      if (actualStatus == false) {
        finalUnits.removeWhere((e) => e.unit.id == unitId);
      } else if (actualStatus == true &&
          !finalUnits.any((e) => e.unit.id == unitId)) {
        // This case shouldn't normally happen if optimistic add worked,
        // but it's a safety check.
        finalUnits.insert(
          0,
          FavoriteUnitModel(id: -1, unit: unit, createdAt: DateTime.now()),
        );
      }

      emit(
        state.copyWith(
          favorites: finalFavorites,
          favoriteUnits: finalUnits,
          status: FavoriteStatus.success,
        ),
      );
    } catch (e) {
      // Rollback on error
      final rollbackFavorites = Map<int, bool>.from(state.favorites);
      rollbackFavorites[unitId] = isCurrentlyFavorite;

      emit(
        state.copyWith(
          favorites: rollbackFavorites,
          favoriteUnits: state.favoriteUnits, // Revert to old list
          status: FavoriteStatus.failure,
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

  void setNetworkFailure() {
    emit(
      state.copyWith(
        listStatus: FavoriteStatus.failure,
        errorMessage: 'No Internet Connection',
      ),
    );
  }
}
