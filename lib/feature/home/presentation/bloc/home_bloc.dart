import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/domain/usecases/get_all_units_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/get_banners_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/get_categories_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/get_latest_units_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/get_nearby_units_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/toggle_favorite_usecase.dart';
import 'package:propix8/feature/home/presentation/bloc/home_event.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_state.dart';

class HomeBloc extends SafeBloc<HomeEvent, HomeState> {
  HomeBloc({
    required GetBannersUseCase getBannersUseCase,
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetNearbyUnitsUseCase getNearbyUnitsUseCase,
    required GetLatestUnitsUseCase getLatestUnitsUseCase,
    required GetAllUnitsUseCase getAllUnitsUseCase,
    required ToggleFavoriteUseCase toggleFavoriteUseCase,
  })  : _getBannersUseCase = getBannersUseCase,
        _getCategoriesUseCase = getCategoriesUseCase,
        _getNearbyUnitsUseCase = getNearbyUnitsUseCase,
        _getLatestUnitsUseCase = getLatestUnitsUseCase,
        _getAllUnitsUseCase = getAllUnitsUseCase,
        _toggleFavoriteUseCase = toggleFavoriteUseCase,
        super(const HomeState()) {
    on<HomeAllDataRequested>(_onAllDataRequested);
    on<HomeBannersRequested>(_onBannersRequested);
    on<HomeCategoriesRequested>(_onCategoriesRequested);
    on<HomeNearbyUnitsRequested>(_onNearbyUnitsRequested);
    on<HomeLatestUnitsRequested>(_onLatestUnitsRequested);
    on<HomeAllUnitsRequested>(_onAllUnitsRequested);
    on<HomeLoadMoreAllUnitsRequested>(_onLoadMoreAllUnitsRequested);
    on<HomeCategorySelected>(_onCategorySelected);
    on<HomeTabChanged>(_onTabChanged);
    on<HomeFilterApplied>(_onFilterApplied);
    on<HomeFilterCleared>(_onFilterCleared);
    on<HomeFavoriteToggled>(_onFavoriteToggled);
    on<HomeNetworkFailureSet>(_onNetworkFailureSet);
    on<HomeRefreshed>(_onRefreshed);
  }

  final GetBannersUseCase _getBannersUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetNearbyUnitsUseCase _getNearbyUnitsUseCase;
  final GetLatestUnitsUseCase _getLatestUnitsUseCase;
  final GetAllUnitsUseCase _getAllUnitsUseCase;
  final ToggleFavoriteUseCase _toggleFavoriteUseCase;

  Future<void> _onAllDataRequested(
    HomeAllDataRequested event,
    Emitter<HomeState> emit,
  ) async {
    add(const HomeEvent.bannersRequested());
    add(const HomeEvent.categoriesRequested());
    add(const HomeEvent.nearbyUnitsRequested());
    add(const HomeEvent.latestUnitsRequested());
    add(const HomeEvent.allUnitsRequested());
  }

  Future<void> _onBannersRequested(
    HomeBannersRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(bannerStatus: HomeRequestStatus.loading, banners: []));
    final result = await _getBannersUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          bannerStatus: HomeRequestStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (banners) => emit(
        state.copyWith(
          bannerStatus: HomeRequestStatus.success,
          banners: banners,
        ),
      ),
    );
  }

  Future<void> _onCategoriesRequested(
    HomeCategoriesRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(categoryStatus: HomeRequestStatus.loading, categories: []),
    );
    final result = await _getCategoriesUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          categoryStatus: HomeRequestStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (categories) => emit(
        state.copyWith(
          categoryStatus: HomeRequestStatus.success,
          categories: categories,
        ),
      ),
    );
  }

  Future<void> _onNearbyUnitsRequested(
    HomeNearbyUnitsRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(nearbyStatus: HomeRequestStatus.loading, nearbyUnits: []),
    );
    final result = await _getNearbyUnitsUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          nearbyStatus: HomeRequestStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) => emit(
        state.copyWith(
          nearbyStatus: HomeRequestStatus.success,
          nearbyUnits: response.data,
        ),
      ),
    );
  }

  Future<void> _onLatestUnitsRequested(
    HomeLatestUnitsRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(latestStatus: HomeRequestStatus.loading, latestUnits: []),
    );
    final result = await _getLatestUnitsUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          latestStatus: HomeRequestStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (units) => emit(
        state.copyWith(
          latestStatus: HomeRequestStatus.success,
          latestUnits: units,
        ),
      ),
    );
  }

  Future<void> _onAllUnitsRequested(
    HomeAllUnitsRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        allStatus: HomeRequestStatus.loading,
        currentPage: 1,
        allUnits: [],
      ),
    );

    String? offerType;
    if (state.activeTab != null) {
      offerType = state.activeTab == HomeTab.buy ? 'sale' : 'rent';
    }
    if (state.filterState?.activeTab != null) {
      offerType =
          state.filterState!.activeTab == PropertyTab.buy ? 'sale' : 'rent';
    }

    String? developmentStatus;
    if (state.filterState?.developmentStatus != null) {
      developmentStatus =
          state.filterState!.developmentStatus == DevelopmentStatus.primary
              ? 'primary'
              : 'resale';
    }

    final result = await _getAllUnitsUseCase(
      unitTypeId: state.selectedUnitTypeId,
      offerType: offerType,
      developmentStatus: developmentStatus,
      minPrice: state.filterState?.minPrice,
      maxPrice: state.filterState?.maxPrice,
      rooms: state.filterState?.rooms == 0 ? null : state.filterState?.rooms,
      bathrooms:
          state.filterState?.bathrooms == 0
              ? null
              : state.filterState?.bathrooms,
      minArea: state.filterState?.minArea,
      maxArea: state.filterState?.maxArea,
      cityId: state.filterState?.selectedCityId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          allStatus: HomeRequestStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) => emit(
        state.copyWith(
          allStatus: HomeRequestStatus.success,
          allUnits: response.data,
          lastPage: response.pagination.lastPage,
          currentPage: 1,
        ),
      ),
    );
  }

  Future<void> _onLoadMoreAllUnitsRequested(
    HomeLoadMoreAllUnitsRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.loadMoreStatus == HomeRequestStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(loadMoreStatus: HomeRequestStatus.loading));
    final nextPage = state.currentPage + 1;

    String? offerType;
    if (state.activeTab != null) {
      offerType = state.activeTab == HomeTab.buy ? 'sale' : 'rent';
    }
    if (state.filterState?.activeTab != null) {
      offerType =
          state.filterState!.activeTab == PropertyTab.buy ? 'sale' : 'rent';
    }

    String? developmentStatus;
    if (state.filterState?.developmentStatus != null) {
      developmentStatus =
          state.filterState!.developmentStatus == DevelopmentStatus.primary
              ? 'primary'
              : 'resale';
    }

    final result = await _getAllUnitsUseCase(
      page: nextPage,
      unitTypeId: state.selectedUnitTypeId,
      offerType: offerType,
      developmentStatus: developmentStatus,
      minPrice: state.filterState?.minPrice,
      maxPrice: state.filterState?.maxPrice,
      rooms: state.filterState?.rooms == 0 ? null : state.filterState?.rooms,
      bathrooms:
          state.filterState?.bathrooms == 0
              ? null
              : state.filterState?.bathrooms,
      minArea: state.filterState?.minArea,
      maxArea: state.filterState?.maxArea,
      cityId: state.filterState?.selectedCityId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          loadMoreStatus: HomeRequestStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) => emit(
        state.copyWith(
          loadMoreStatus: HomeRequestStatus.success,
          allUnits: [...state.allUnits, ...response.data],
          currentPage: nextPage,
          lastPage: response.pagination.lastPage,
        ),
      ),
    );
  }

  void _onCategorySelected(
    HomeCategorySelected event,
    Emitter<HomeState> emit,
  ) {
    if (state.selectedUnitTypeId == event.categoryId) return;
    emit(state.copyWith(selectedUnitTypeId: event.categoryId));
    add(const HomeEvent.allUnitsRequested());
  }

  void _onTabChanged(HomeTabChanged event, Emitter<HomeState> emit) {
    if (state.activeTab == event.tab) return;
    emit(state.copyWith(activeTab: event.tab));
    add(const HomeEvent.allUnitsRequested());
  }

  void _onFilterApplied(HomeFilterApplied event, Emitter<HomeState> emit) {
    emit(state.copyWith(filterState: event.filterState));
    add(const HomeEvent.allUnitsRequested());
  }

  void _onFilterCleared(HomeFilterCleared event, Emitter<HomeState> emit) {
    emit(state.copyWith(filterState: null));
    add(const HomeEvent.allUnitsRequested());
  }

  Future<void> _onFavoriteToggled(
    HomeFavoriteToggled event,
    Emitter<HomeState> emit,
  ) async {
    List<UnitEntity> toggleInList(List<UnitEntity> list) => list.map((unit) {
      if (unit.id == event.unitId) {
        final currentFav = unit.isFavorite ?? false;
        return unit.copyWithUnit(isFavorite: !currentFav);
      }
      return unit;
    }).toList();

    List<UnitEntity> syncInList(
      List<UnitEntity> list, {
      required bool isFav,
    }) => list
        .map(
          (unit) => unit.id == event.unitId
              ? unit.copyWithUnit(isFavorite: isFav)
              : unit,
        )
        .toList();

    emit(
      state.copyWith(
        allUnits: toggleInList(state.allUnits),
        nearbyUnits: toggleInList(state.nearbyUnits),
        latestUnits: toggleInList(state.latestUnits),
      ),
    );

    final result = await _toggleFavoriteUseCase(event.unitId);
    result.fold(
      (_) {
        // Rollback on failure
        emit(
          state.copyWith(
            allUnits: toggleInList(state.allUnits),
            nearbyUnits: toggleInList(state.nearbyUnits),
            latestUnits: toggleInList(state.latestUnits),
          ),
        );
      },
      (isFav) {
        emit(
          state.copyWith(
            allUnits: syncInList(state.allUnits, isFav: isFav),
            nearbyUnits: syncInList(state.nearbyUnits, isFav: isFav),
            latestUnits: syncInList(state.latestUnits, isFav: isFav),
          ),
        );
      },
    );
  }

  void _onNetworkFailureSet(
    HomeNetworkFailureSet event,
    Emitter<HomeState> emit,
  ) {
    const error = 'No Internet Connection';
    emit(
      state.copyWith(
        allStatus: HomeRequestStatus.failure,
        bannerStatus: HomeRequestStatus.failure,
        categoryStatus: HomeRequestStatus.failure,
        nearbyStatus: HomeRequestStatus.failure,
        latestStatus: HomeRequestStatus.failure,
        errorMessage: error,
      ),
    );
  }

  void _onRefreshed(HomeRefreshed event, Emitter<HomeState> emit) {
    add(const HomeEvent.allDataRequested());
  }
}
