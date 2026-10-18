import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/favorites/domain/repositories/favorites_repository.dart';

class ToggleFavoriteItemUseCase {
  const ToggleFavoriteItemUseCase(this._repository);

  final FavoritesRepository _repository;

  ResultFuture<bool> call(int unitId) => _repository.toggleFavorite(unitId);
}
