import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/domain/repositories/unit_repository.dart';

class GetLatestUnitsUseCase {
  const GetLatestUnitsUseCase(this._repository);

  final UnitRepository _repository;

  Future<Either<Failure, List<UnitEntity>>> call() =>
      _repository.getLatestUnits();
}
