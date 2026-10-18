import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/home/domain/entities/category_entity.dart';
import 'package:propix8/feature/home/domain/repositories/unit_repository.dart';

class GetCategoriesUseCase {
  const GetCategoriesUseCase(this._repository);

  final UnitRepository _repository;

  ResultFuture<List<CategoryEntity>> call() => _repository.getCategories();
}
