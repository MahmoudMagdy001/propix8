import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/domain/repositories/unit_repository.dart';

class GetLatestUnitsUseCase {
  const GetLatestUnitsUseCase(this._repository);

  final UnitRepository _repository;

  ResultFuture<List<UnitEntity>> call() => _repository.getLatestUnits();
}
