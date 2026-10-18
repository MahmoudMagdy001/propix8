import 'package:propix8/core/functional/result.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/domain/repositories/unit_repository.dart';

class GetNearbyUnitsUseCase {
  const GetNearbyUnitsUseCase(this._repository);

  final UnitRepository _repository;

  ResultFuture<PaginatedResponse<UnitEntity>> call({int page = 1}) =>
      _repository.getNearbyUnits(page: page);
}
