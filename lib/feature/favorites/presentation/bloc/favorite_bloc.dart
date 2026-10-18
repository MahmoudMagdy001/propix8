import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_unit_entity.dart';
import 'package:propix8/feature/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:propix8/feature/favorites/domain/usecases/toggle_favorite_item_usecase.dart';
import 'package:propix8/feature/favorites/presentation/bloc/favorite_event.dart';
import 'package:propix8/feature/favorites/presentation/bloc/favorite_state.dart';

class FavoriteBloc extends SafeBloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({
    required GetFavoritesUseCase getFavoritesUseCase,
    required ToggleFavoriteItemUseCase toggleFavoriteItemUseCase,
  })  : _getFavoritesUseCase = getFavoritesUseCase,
        _toggleFavoriteItemUseCase = toggleFavoriteItemUseCase,
        super(const FavoriteState()) {
    on<GetFavoritesRequested>(_onGetFavoritesRequested);
    on<FavoriteToggled>(_onFavoriteToggled);
    on<FavoriteStatusUpdated>(_onFavoriteStatusUpdated);
    on<FavoritesInitialized>(_onFavoritesInitialized);
    on<FavoriteViewTypeToggled>(_onFavoriteViewTypeToggled);
  }

  final GetFavoritesUseCase _getFavoritesUseCase;
  final ToggleFavoriteItemUseCase _toggleFavoriteItemUseCase;

  Future<void> _onGetFavoritesRequested(
    GetFavoritesRequested event,
    Emitter<FavoriteState> emit,
  ) async {
    // Skip fetch if data is already loaded (prevents refetch on tab switch)
    if (!event.isLoadMore &&
        !event.forceRefresh &&
        state.listStatus == FavoriteStatus.success &&
        state.favoriteUnits.isNotEmpty) {
      return;
    }
    if (event.isLoadMore && !state.hasMore) return;
    if (event.isLoadMore && state.listStatus == FavoriteStatus.loading) return;

    emit(
      state.copyWith(
        listStatus: FavoriteStatus.loading,
        currentPage: event.isLoadMore ? state.currentPage : 1,
        favoriteUnits: event.isLoadMore ? state.favoriteUnits : const [],
      ),
    );

    final result = await _getFavoritesUseCase(
      page: event.isLoadMore ? state.currentPage + 1 : 1,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          listStatus: FavoriteStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) {
        final units = event.isLoadMore
            ? [...state.favoriteUnits, ...response.data]
            : response.data;

        // Update the favorites map for ALL units in the list
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
      },
    );
  }

  void _onFavoriteStatusUpdated(
    FavoriteStatusUpdated event,
    Emitter<FavoriteState> emit,
  ) {
    final updatedFavorites = Map<int, bool>.from(state.favorites);
    updatedFavorites[event.unitId] = event.isFavorite;
    emit(state.copyWith(favorites: updatedFavorites));
  }

  void _onFavoritesInitialized(
    FavoritesInitialized event,
    Emitter<FavoriteState> emit,
  ) {
    final updatedFavorites = Map<int, bool>.from(state.favorites)
      ..addAll(event.initialFavorites);
    emit(state.copyWith(favorites: updatedFavorites));
  }

  void _onFavoriteViewTypeToggled(
    FavoriteViewTypeToggled event,
    Emitter<FavoriteState> emit,
  ) {
    emit(
      state.copyWith(
        viewType:
            state.viewType == ViewType.grid ? ViewType.list : ViewType.grid,
      ),
    );
  }

  Future<void> _onFavoriteToggled(
    FavoriteToggled event,
    Emitter<FavoriteState> emit,
  ) async {
    final unit = event.unit;
    final unitId = unit.id;
    final isCurrentlyFavorite = state.favorites[unitId] ?? false;

    // Optimistic update for the favorites map (the icon)
    final optimisticFavorites = Map<int, bool>.from(state.favorites);
    optimisticFavorites[unitId] = !isCurrentlyFavorite;

    final previousUnits = state.favoriteUnits;
    final optimisticUnits = List<FavoriteUnitEntity>.from(state.favoriteUnits);
    if (isCurrentlyFavorite) {
      // Remove immediately
      optimisticUnits.removeWhere((e) => e.unit.id == unitId);
    } else {
      // Add immediately as a placeholder
      optimisticUnits.insert(
        0,
        FavoriteUnitEntity(
          id: -1,
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

    final result = await _toggleFavoriteItemUseCase(unitId);

    result.fold(
      (failure) {
        // Rollback on error
        final rollbackFavorites = Map<int, bool>.from(state.favorites);
        rollbackFavorites[unitId] = isCurrentlyFavorite;

        emit(
          state.copyWith(
            favorites: rollbackFavorites,
            favoriteUnits: previousUnits,
            status: FavoriteStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (actualStatus) {
        final finalFavorites = Map<int, bool>.from(state.favorites);
        finalFavorites[unitId] = actualStatus;

        // Ensure the list is in sync with the actual server response
        final finalUnits = List<FavoriteUnitEntity>.from(state.favoriteUnits);
        if (actualStatus == false) {
          finalUnits.removeWhere((e) => e.unit.id == unitId);
        } else if (actualStatus == true &&
            !finalUnits.any((e) => e.unit.id == unitId)) {
          finalUnits.insert(
            0,
            FavoriteUnitEntity(id: -1, unit: unit, createdAt: DateTime.now()),
          );
        }

        emit(
          state.copyWith(
            favorites: finalFavorites,
            favoriteUnits: finalUnits,
            status: FavoriteStatus.success,
          ),
        );
      },
    );
  }
}
