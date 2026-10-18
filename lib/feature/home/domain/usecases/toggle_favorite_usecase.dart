import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/home/domain/repositories/unit_repository.dart';

class ToggleFavoriteUseCase {
  const ToggleFavoriteUseCase(this._repository);

  final UnitRepository _repository;

  ResultFuture<bool> call(int unitId) => _repository.toggleFavorite(unitId);
}
