import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_response_entity.dart';

abstract class FavoritesRepository {
  ResultFuture<FavoriteResponseEntity> getFavorites({int page = 1});
  ResultFuture<bool> toggleFavorite(int unitId);
}
