import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/developer_details/domain/entities/developer_collection_entity.dart';
import 'package:propix8/feature/developer_details/domain/repositories/developer_details_repository.dart';

class GetDeveloperUnitsUseCase {
  const GetDeveloperUnitsUseCase(this._repository);

  final DeveloperDetailsRepository _repository;

  Future<Either<Failure, DeveloperCollectionEntity>> call(
    int id, {
    int? page,
  }) =>
      _repository.getDeveloperUnits(id, page: page);
}
