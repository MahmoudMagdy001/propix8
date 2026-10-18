import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';

class GetRelatedUnitsUseCase {
  const GetRelatedUnitsUseCase(this._repository);
  final UnitDetailsRepository _repository;

  ResultFuture<List<UnitEntity>> call(int unitId) =>
      _repository.getRelatedUnits(unitId);
}
