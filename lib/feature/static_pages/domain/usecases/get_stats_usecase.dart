import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/static_pages/domain/entities/stat_entity.dart';
import 'package:propix8/feature/static_pages/domain/repositories/pages_repository.dart';

class GetStatsUseCase {
  const GetStatsUseCase(this._repository);

  final PagesRepository _repository;

  ResultFuture<List<StatEntity>> call() => _repository.getStats();
}
