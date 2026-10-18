import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/compound_details/domain/entities/compound_collection_entity.dart';
import 'package:propix8/feature/compound_details/domain/repositories/compound_details_repository.dart';

class GetCompoundUnitsUseCase {
  const GetCompoundUnitsUseCase(this._repository);

  final CompoundDetailsRepository _repository;

  ResultFuture<CompoundCollectionEntity> call(
    int id, {
    int? page,
  }) =>
      _repository.getCompoundUnits(id, page: page);
}
