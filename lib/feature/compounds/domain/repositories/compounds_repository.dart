import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/compounds/domain/entities/compound_entity.dart';

abstract class CompoundsRepository {
  Future<Either<Failure, List<CompoundEntity>>> getCompounds();
}
