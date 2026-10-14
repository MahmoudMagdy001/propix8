import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/home/domain/repositories/unit_repository.dart';

class ToggleFavoriteUseCase {
  const ToggleFavoriteUseCase(this._repository);

  final UnitRepository _repository;

  Future<Either<Failure, bool>> call(int unitId) =>
      _repository.toggleFavorite(unitId);
}
