import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_unit_entity.dart';

part 'favorite_state.freezed.dart';

enum FavoriteStatus { initial, loading, success, failure }

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(FavoriteStatus.initial) FavoriteStatus status,
    @Default(FavoriteStatus.initial) FavoriteStatus listStatus,
    @Default({}) Map<int, bool> favorites,
    @Default([]) List<FavoriteUnitEntity> favoriteUnits,
    String? errorMessage,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(ViewType.grid) ViewType viewType,
  }) = _FavoriteState;

  const FavoriteState._();

  bool get hasMore => currentPage < lastPage;

  bool get shouldShowErrorWidget =>
      listStatus == FavoriteStatus.failure && favoriteUnits.isEmpty;
}
