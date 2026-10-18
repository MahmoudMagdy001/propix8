import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/developers/domain/entities/developer_entity.dart';
import 'package:propix8/feature/developers/domain/repositories/developers_repository.dart';

class GetDevelopersUseCase {
  const GetDevelopersUseCase(this._repository);

  final DevelopersRepository _repository;

  ResultFuture<List<DeveloperEntity>> call() => _repository.getDevelopers();
}
