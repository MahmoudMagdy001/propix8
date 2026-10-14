import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/compound_details/domain/entities/compound_collection_entity.dart';

abstract class CompoundDetailsRepository {
  Future<Either<Failure, CompoundCollectionEntity>> getCompoundUnits(
    int id, {
    int? page,
  });
}
