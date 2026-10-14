import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_response_entity.dart';
import 'package:propix8/feature/favorites/domain/repositories/favorites_repository.dart';

class GetFavoritesUseCase {
  const GetFavoritesUseCase(this._repository);

  final FavoritesRepository _repository;

  Future<Either<Failure, FavoriteResponseEntity>> call({int page = 1}) =>
      _repository.getFavorites(page: page);
}
