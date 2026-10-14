import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/domain/repositories/unit_repository.dart';

class GetNearbyUnitsUseCase {
  const GetNearbyUnitsUseCase(this._repository);

  final UnitRepository _repository;

  Future<Either<Failure, PaginatedResponse<UnitEntity>>> call({int page = 1}) =>
      _repository.getNearbyUnits(page: page);
}
