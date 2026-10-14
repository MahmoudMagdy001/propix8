import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/home/domain/entities/category_entity.dart';
import 'package:propix8/feature/home/domain/repositories/unit_repository.dart';

class GetCategoriesUseCase {
  const GetCategoriesUseCase(this._repository);

  final UnitRepository _repository;

  Future<Either<Failure, List<CategoryEntity>>> call() =>
      _repository.getCategories();
}
