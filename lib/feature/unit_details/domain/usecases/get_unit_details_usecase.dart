import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';

class GetUnitDetailsUseCase {
  const GetUnitDetailsUseCase(this._repository);
  final UnitDetailsRepository _repository;

  ResultFuture<UnitDetailsEntity> call(int unitId) =>
      _repository.getUnitDetails(unitId);
}
