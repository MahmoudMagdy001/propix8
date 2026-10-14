import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/developer_details/domain/entities/developer_collection_entity.dart';

abstract class DeveloperDetailsRepository {
  Future<Either<Failure, DeveloperCollectionEntity>> getDeveloperUnits(
    int id, {
    int? page,
  });
}
