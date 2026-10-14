import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/static_pages/domain/entities/stat_entity.dart';
import 'package:propix8/feature/static_pages/domain/repositories/pages_repository.dart';

class GetStatsUseCase {
  const GetStatsUseCase(this._repository);

  final PagesRepository _repository;

  Future<Either<Failure, List<StatEntity>>> call() => _repository.getStats();
}
