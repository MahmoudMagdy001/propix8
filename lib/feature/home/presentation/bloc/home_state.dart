import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/home/domain/entities/banner_entity.dart';
import 'package:propix8/feature/home/domain/entities/category_entity.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_state.dart';

part 'home_state.freezed.dart';

enum HomeRequestStatus { initial, loading, success, failure }

enum HomeTab { buy, rent }

@freezed
abstract class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    @Default(HomeRequestStatus.initial) HomeRequestStatus nearbyStatus,
    @Default(HomeRequestStatus.initial) HomeRequestStatus latestStatus,
    @Default(HomeRequestStatus.initial) HomeRequestStatus allStatus,
    @Default(HomeRequestStatus.initial) HomeRequestStatus categoryStatus,
    @Default(HomeRequestStatus.initial) HomeRequestStatus bannerStatus,
    @Default(HomeRequestStatus.initial) HomeRequestStatus loadMoreStatus,
    @Default([]) List<UnitEntity> nearbyUnits,
    @Default([]) List<UnitEntity> latestUnits,
    @Default([]) List<UnitEntity> allUnits,
    @Default([]) List<CategoryEntity> categories,
    @Default([]) List<BannerEntity> banners,
    HomeTab? activeTab,
    int? selectedUnitTypeId,
    FilterState? filterState,
    String? errorMessage,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
  }) = _HomeState;

  bool get hasMore => currentPage < lastPage;

  bool get shouldShowErrorWidget =>
      allStatus == HomeRequestStatus.failure && allUnits.isEmpty;
}
