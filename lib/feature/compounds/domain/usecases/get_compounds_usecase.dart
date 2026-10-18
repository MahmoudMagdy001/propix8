import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/compounds/domain/entities/compound_entity.dart';
import 'package:propix8/feature/compounds/domain/repositories/compounds_repository.dart';

class GetCompoundsUseCase {
  const GetCompoundsUseCase(this._repository);

  final CompoundsRepository _repository;

  ResultFuture<List<CompoundEntity>> call() => _repository.getCompounds();
}
