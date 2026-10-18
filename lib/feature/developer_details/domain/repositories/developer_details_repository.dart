import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/developer_details/domain/entities/developer_collection_entity.dart';

abstract class DeveloperDetailsRepository {
  ResultFuture<DeveloperCollectionEntity> getDeveloperUnits(
    int id, {
    int? page,
  });
}
