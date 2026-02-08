import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/views/map/repositories/address_setup_repository.dart';
import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(this._addressSetupRepository) : super(const FilterState());
  final AddressSetupRepository _addressSetupRepository;

  Future<void> fetchCities() async {
    emit(state.copyWith(status: FilterStatus.citiesLoading));
    final result = await _addressSetupRepository.getCities();
    if (isClosed) return;
    result.fold(
      (error) => emit(
        state.copyWith(status: FilterStatus.failure, errorMessage: error),
      ),
      (cities) => emit(
        state.copyWith(status: FilterStatus.citiesLoaded, cities: cities),
      ),
    );
  }

  void selectCity(int cityId) {
    emit(state.copyWith(selectedCityId: cityId));
  }

  void changeTab(PropertyTab? tab) {
    if (state.activeTab == tab) return;

    if (tab == null) {
      emit(state.copyWith(clearActiveTab: true));
    } else {
      emit(state.copyWith(activeTab: tab));
    }
  }

  void changeDevelopmentStatus(DevelopmentStatus? status) {
    if (state.developmentStatus == status) return;

    if (status == null) {
      emit(state.copyWith(clearDevelopmentStatus: true));
    } else {
      emit(state.copyWith(developmentStatus: status));
    }
  }

  void updateLocation(String location) {
    emit(state.copyWith(location: location));
  }

  void updatePriceRange(double min, double max) {
    emit(state.copyWith(minPrice: min, maxPrice: max));
  }

  void updateBedrooms(int count) {
    if (count < 0) return;
    emit(state.copyWith(bedrooms: count));
  }

  void updateBathrooms(int count) {
    if (count < 0) return;
    emit(state.copyWith(bathrooms: count));
  }

  void updateRooms(int count) {
    if (count < 0) return;
    emit(state.copyWith(rooms: count));
  }

  void updateAreaRange(double min, double max) {
    emit(state.copyWith(minArea: min, maxArea: max));
  }

  void reset() {
    emit(const FilterState());
    fetchCities();
  }
}
