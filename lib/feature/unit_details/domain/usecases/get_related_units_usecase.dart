import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';

class GetRelatedUnitsUseCase {
  const GetRelatedUnitsUseCase(this._repository);
  final UnitDetailsRepository _repository;

  Future<Either<Failure, List<UnitEntity>>> call(int unitId) =>
      _repository.getRelatedUnits(unitId);
}
