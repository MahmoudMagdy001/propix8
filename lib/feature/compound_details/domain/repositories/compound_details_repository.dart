import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/compound_details/domain/entities/compound_collection_entity.dart';

abstract class CompoundDetailsRepository {
  ResultFuture<CompoundCollectionEntity> getCompoundUnits(
    int id, {
    int? page,
  });
}
