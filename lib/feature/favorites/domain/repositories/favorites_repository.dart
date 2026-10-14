import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_response_entity.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, FavoriteResponseEntity>> getFavorites({int page = 1});
  Future<Either<Failure, bool>> toggleFavorite(int unitId);
}
