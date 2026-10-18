import 'dart:async';

import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/auth/domain/repositories/address_setup_repository.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_event.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_state.dart';

class FilterBloc extends SafeBloc<FilterEvent, FilterState> {
  FilterBloc(this._addressSetupRepository) : super(const FilterState()) {
    on<FilterCitiesRequested>(_onCitiesRequested);
    on<FilterCitySelected>(_onCitySelected);
    on<FilterTabChanged>(_onTabChanged);
    on<FilterDevelopmentStatusChanged>(_onDevelopmentStatusChanged);
    on<FilterLocationUpdated>(_onLocationUpdated);
    on<FilterPriceRangeUpdated>(_onPriceRangeUpdated);
    on<FilterBedroomsUpdated>(_onBedroomsUpdated);
    on<FilterBathroomsUpdated>(_onBathroomsUpdated);
    on<FilterRoomsUpdated>(_onRoomsUpdated);
    on<FilterAreaRangeUpdated>(_onAreaRangeUpdated);
    on<FilterReset>(_onReset);
  }

  final AddressSetupRepository _addressSetupRepository;

  Future<void> _onCitiesRequested(
    FilterCitiesRequested event,
    Emitter<FilterState> emit,
  ) async {
    emit(state.copyWith(status: FilterStatus.citiesLoading));
    final result = await _addressSetupRepository.getCities();
    result.fold(
      (error) => emit(
        state.copyWith(status: FilterStatus.failure, errorMessage: error.message),
      ),
      (cities) => emit(
        state.copyWith(status: FilterStatus.citiesLoaded, cities: cities),
      ),
    );
  }

  void _onCitySelected(FilterCitySelected event, Emitter<FilterState> emit) {
    emit(state.copyWith(selectedCityId: event.cityId));
  }

  void _onTabChanged(FilterTabChanged event, Emitter<FilterState> emit) {
    if (state.activeTab == event.tab) return;
    emit(state.copyWith(activeTab: event.tab));
  }

  void _onDevelopmentStatusChanged(
    FilterDevelopmentStatusChanged event,
    Emitter<FilterState> emit,
  ) {
    if (state.developmentStatus == event.status) return;
    emit(state.copyWith(developmentStatus: event.status));
  }

  void _onLocationUpdated(
    FilterLocationUpdated event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(location: event.location));
  }

  void _onPriceRangeUpdated(
    FilterPriceRangeUpdated event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(minPrice: event.min, maxPrice: event.max));
  }

  void _onBedroomsUpdated(
    FilterBedroomsUpdated event,
    Emitter<FilterState> emit,
  ) {
    if (event.count < 0) return;
    emit(state.copyWith(bedrooms: event.count));
  }

  void _onBathroomsUpdated(
    FilterBathroomsUpdated event,
    Emitter<FilterState> emit,
  ) {
    if (event.count < 0) return;
    emit(state.copyWith(bathrooms: event.count));
  }

  void _onRoomsUpdated(FilterRoomsUpdated event, Emitter<FilterState> emit) {
    if (event.count < 0) return;
    emit(state.copyWith(rooms: event.count));
  }

  void _onAreaRangeUpdated(
    FilterAreaRangeUpdated event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(minArea: event.min, maxArea: event.max));
  }

  void _onReset(FilterReset event, Emitter<FilterState> emit) {
    emit(const FilterState());
    add(const FilterEvent.citiesRequested());
  }
}
