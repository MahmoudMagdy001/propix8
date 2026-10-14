import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_state.dart';

part 'home_event.freezed.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.allDataRequested() = HomeAllDataRequested;

  const factory HomeEvent.bannersRequested() = HomeBannersRequested;

  const factory HomeEvent.categoriesRequested() = HomeCategoriesRequested;

  const factory HomeEvent.nearbyUnitsRequested() = HomeNearbyUnitsRequested;

  const factory HomeEvent.latestUnitsRequested() = HomeLatestUnitsRequested;

  const factory HomeEvent.allUnitsRequested({@Default(1) int page}) =
      HomeAllUnitsRequested;

  const factory HomeEvent.loadMoreAllUnitsRequested() =
      HomeLoadMoreAllUnitsRequested;

  const factory HomeEvent.categorySelected(int? categoryId) =
      HomeCategorySelected;

  const factory HomeEvent.tabChanged(HomeTab? tab) = HomeTabChanged;

  const factory HomeEvent.filterApplied(FilterState filterState) =
      HomeFilterApplied;

  const factory HomeEvent.filterCleared() = HomeFilterCleared;

  const factory HomeEvent.favoriteToggled(int unitId) = HomeFavoriteToggled;

  const factory HomeEvent.networkFailureSet() = HomeNetworkFailureSet;

  const factory HomeEvent.refreshed() = HomeRefreshed;
}
