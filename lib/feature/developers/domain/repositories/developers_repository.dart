import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/developers/domain/entities/developer_entity.dart';

abstract class DevelopersRepository {
  Future<Either<Failure, List<DeveloperEntity>>> getDevelopers();
}
