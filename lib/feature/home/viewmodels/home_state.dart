import 'package:equatable/equatable.dart';

import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/unit_model.dart';
import '../views/filter/viewmodels/filter_state.dart';

enum HomeRequestStatus { initial, loading, success, failure }

enum HomeTab { buy, rent }

class HomeState extends Equatable {
  const HomeState({
    this.nearbyStatus = HomeRequestStatus.initial,
    this.latestStatus = HomeRequestStatus.initial,
    this.allStatus = HomeRequestStatus.initial,
    this.categoryStatus = HomeRequestStatus.initial,
    this.bannerStatus = HomeRequestStatus.initial,
    this.loadMoreStatus = HomeRequestStatus.initial,
    this.nearbyUnits = const [],
    this.latestUnits = const [],
    this.allUnits = const [],
    this.categories = const [],
    this.banners = const [],
    this.activeTab,
    this.selectedUnitTypeId,
    this.filterState,
    this.errorMessage,
    this.currentPage = 1,
    this.lastPage = 1,
  });

  final HomeRequestStatus nearbyStatus;
  final HomeRequestStatus latestStatus;
  final HomeRequestStatus allStatus;
  final HomeRequestStatus categoryStatus;
  final HomeRequestStatus bannerStatus;
  final HomeRequestStatus loadMoreStatus;
  final List<UnitModel> nearbyUnits;
  final List<UnitModel> latestUnits;
  final List<UnitModel> allUnits;
  final List<CategoryModel> categories;
  final List<BannerModel> banners;
  final HomeTab? activeTab;
  final int? selectedUnitTypeId;
  final FilterState? filterState;
  final String? errorMessage;
  final int currentPage;
  final int lastPage;

  bool get hasMore => currentPage < lastPage;

  bool get shouldShowErrorWidget =>
      allStatus == HomeRequestStatus.failure && allUnits.isEmpty;

  HomeState copyWith({
    HomeRequestStatus? nearbyStatus,
    HomeRequestStatus? latestStatus,
    HomeRequestStatus? allStatus,
    HomeRequestStatus? categoryStatus,
    HomeRequestStatus? bannerStatus,
    HomeRequestStatus? loadMoreStatus,
    List<UnitModel>? nearbyUnits,
    List<UnitModel>? latestUnits,
    List<UnitModel>? allUnits,
    List<CategoryModel>? categories,
    List<BannerModel>? banners,
    HomeTab? activeTab,
    bool clearActiveTab = false,
    int? selectedUnitTypeId,
    FilterState? filterState,
    bool clearSelectedUnitType = false,
    bool clearFilter = false,
    String? errorMessage,
    int? currentPage,
    int? lastPage,
  }) => HomeState(
    nearbyStatus: nearbyStatus ?? this.nearbyStatus,
    latestStatus: latestStatus ?? this.latestStatus,
    allStatus: allStatus ?? this.allStatus,
    categoryStatus: categoryStatus ?? this.categoryStatus,
    bannerStatus: bannerStatus ?? this.bannerStatus,
    loadMoreStatus: loadMoreStatus ?? this.loadMoreStatus,
    nearbyUnits: nearbyUnits ?? this.nearbyUnits,
    latestUnits: latestUnits ?? this.latestUnits,
    allUnits: allUnits ?? this.allUnits,
    categories: categories ?? this.categories,
    banners: banners ?? this.banners,
    activeTab: clearActiveTab ? null : (activeTab ?? this.activeTab),
    selectedUnitTypeId: clearSelectedUnitType
        ? null
        : (selectedUnitTypeId ?? this.selectedUnitTypeId),
    filterState: clearFilter ? null : (filterState ?? this.filterState),
    errorMessage: errorMessage ?? this.errorMessage,
    currentPage: currentPage ?? this.currentPage,
    lastPage: lastPage ?? this.lastPage,
  );

  @override
  List<Object?> get props => [
    nearbyStatus,
    latestStatus,
    allStatus,
    categoryStatus,
    bannerStatus,
    loadMoreStatus,
    nearbyUnits,
    latestUnits,
    allUnits,
    categories,
    banners,
    activeTab,
    selectedUnitTypeId,
    filterState,
    errorMessage,
    currentPage,
    lastPage,
  ];
}
