import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/feature/home/repositories/unit_repository.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';
import 'package:propix8/feature/home/views/filter/viewmodels/filter_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._unitRepository) : super(const HomeState());
  final UnitRepository _unitRepository;

  Future<void> fetchAllData() async {
    await Future.wait([
      fetchBanners(),
      fetchNearbyUnits(),
      fetchLatestUnits(),
      fetchCategories(),
      fetchAllUnits(),
    ]);
  }

  Future<void> fetchBanners() async {
    emit(state.copyWith(bannerStatus: HomeRequestStatus.loading, banners: []));
    try {
      final banners = await _unitRepository.getBanners();
      if (isClosed) return;
      emit(
        state.copyWith(
          bannerStatus: HomeRequestStatus.success,
          banners: banners,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          bannerStatus: HomeRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> fetchCategories() async {
    emit(
      state.copyWith(categoryStatus: HomeRequestStatus.loading, categories: []),
    );
    try {
      final categories = await _unitRepository.getCategories();
      if (isClosed) return;
      emit(
        state.copyWith(
          categoryStatus: HomeRequestStatus.success,
          categories: categories,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          categoryStatus: HomeRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> fetchNearbyUnits() async {
    emit(
      state.copyWith(nearbyStatus: HomeRequestStatus.loading, nearbyUnits: []),
    );
    try {
      final response = await _unitRepository.getNearbyUnits();
      if (isClosed) return;
      emit(
        state.copyWith(
          nearbyStatus: HomeRequestStatus.success,
          nearbyUnits: response.units,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          nearbyStatus: HomeRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> fetchLatestUnits() async {
    emit(
      state.copyWith(latestStatus: HomeRequestStatus.loading, latestUnits: []),
    );
    try {
      final units = await _unitRepository.getLatestUnits();
      if (isClosed) return;
      emit(
        state.copyWith(
          latestStatus: HomeRequestStatus.success,
          latestUnits: units,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          latestStatus: HomeRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> fetchAllUnits() async {
    emit(
      state.copyWith(
        allStatus: HomeRequestStatus.loading,
        currentPage: 1,
        allUnits: [],
      ),
    );
    try {
      String? offerType;
      if (state.activeTab != null) {
        offerType = state.activeTab == HomeTab.buy ? 'sale' : 'rent';
      }

      if (state.filterState?.activeTab != null) {
        offerType = state.filterState!.activeTab == PropertyTab.buy
            ? 'sale'
            : 'rent';
      }

      String? developmentStatus;
      if (state.filterState?.developmentStatus != null) {
        developmentStatus =
            state.filterState!.developmentStatus == DevelopmentStatus.primary
            ? 'primary'
            : 'resale';
      }

      final response = await _unitRepository.getAllUnits(
        unitTypeId: state.selectedUnitTypeId,
        offerType: offerType,
        developmentStatus: developmentStatus,
        minPrice: state.filterState?.minPrice,
        maxPrice: state.filterState?.maxPrice,
        rooms: state.filterState?.rooms == 0 ? null : state.filterState?.rooms,
        bathrooms: state.filterState?.bathrooms == 0
            ? null
            : state.filterState?.bathrooms,
        minArea: state.filterState?.minArea,
        maxArea: state.filterState?.maxArea,
        cityId: state.filterState?.selectedCityId,
      );
      if (isClosed) return;

      emit(
        state.copyWith(
          allStatus: HomeRequestStatus.success,
          allUnits: response.units,
          lastPage: response.pagination?.lastPage ?? 1,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          allStatus: HomeRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> loadMoreUnits() async {
    if (state.loadMoreStatus == HomeRequestStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(loadMoreStatus: HomeRequestStatus.loading));
    try {
      final nextPage = state.currentPage + 1;

      String? offerType;
      if (state.activeTab != null) {
        offerType = state.activeTab == HomeTab.buy ? 'sale' : 'rent';
      }

      if (state.filterState?.activeTab != null) {
        offerType = state.filterState!.activeTab == PropertyTab.buy
            ? 'sale'
            : 'rent';
      }

      String? developmentStatus;
      if (state.filterState?.developmentStatus != null) {
        developmentStatus =
            state.filterState!.developmentStatus == DevelopmentStatus.primary
            ? 'primary'
            : 'resale';
      }

      final response = await _unitRepository.getAllUnits(
        page: nextPage,
        unitTypeId: state.selectedUnitTypeId,
        offerType: offerType,
        developmentStatus: developmentStatus,
        minPrice: state.filterState?.minPrice,
        maxPrice: state.filterState?.maxPrice,
        rooms: state.filterState?.rooms == 0 ? null : state.filterState?.rooms,
        bathrooms: state.filterState?.bathrooms == 0
            ? null
            : state.filterState?.bathrooms,
        minArea: state.filterState?.minArea,
        maxArea: state.filterState?.maxArea,
        cityId: state.filterState?.selectedCityId,
      );
      if (isClosed) return;

      emit(
        state.copyWith(
          loadMoreStatus: HomeRequestStatus.success,
          allUnits: [...state.allUnits, ...response.units],
          currentPage: nextPage,
          lastPage: response.pagination?.lastPage ?? state.lastPage,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loadMoreStatus: HomeRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void changeTab(HomeTab? tab) {
    if (state.activeTab == tab) return;

    if (tab == null) {
      emit(state.copyWith(clearActiveTab: true));
    } else {
      emit(state.copyWith(activeTab: tab));
    }
    fetchAllUnits();
  }

  void changeCategory(int? unitTypeId) {
    if (state.selectedUnitTypeId == unitTypeId) return;

    if (unitTypeId == null) {
      emit(state.copyWith(clearSelectedUnitType: true));
    } else {
      emit(state.copyWith(selectedUnitTypeId: unitTypeId));
    }
    fetchAllUnits();
  }

  void applyFilters(FilterState filters) {
    emit(state.copyWith(filterState: filters));
    fetchAllUnits();
  }

  void resetFilters() {
    emit(state.copyWith(clearFilter: true));
    fetchAllUnits();
  }

  void setNetworkFailure() {
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
}
