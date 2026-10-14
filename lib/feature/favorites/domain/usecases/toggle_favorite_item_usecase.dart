import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/favorites/domain/repositories/favorites_repository.dart';

class ToggleFavoriteItemUseCase {
  const ToggleFavoriteItemUseCase(this._repository);

  final FavoritesRepository _repository;

  Future<Either<Failure, bool>> call(int unitId) =>
      _repository.toggleFavorite(unitId);
}
