import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

part 'favorite_event.freezed.dart';

@freezed
abstract class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.getFavoritesRequested({
    @Default(false) bool isLoadMore,
    @Default(false) bool forceRefresh,
  }) = GetFavoritesRequested;

  const factory FavoriteEvent.favoriteToggled(UnitEntity unit) = FavoriteToggled;

  const factory FavoriteEvent.favoriteStatusUpdated({
    required int unitId,
    required bool isFavorite,
  }) = FavoriteStatusUpdated;

  const factory FavoriteEvent.favoritesInitialized(
    Map<int, bool> initialFavorites,
  ) = FavoritesInitialized;

  const factory FavoriteEvent.favoriteViewTypeToggled() =
      FavoriteViewTypeToggled;
}
