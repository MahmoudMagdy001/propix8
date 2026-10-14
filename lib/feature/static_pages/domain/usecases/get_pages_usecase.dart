import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/static_pages/domain/entities/page_entity.dart';
import 'package:propix8/feature/static_pages/domain/repositories/pages_repository.dart';

class GetPagesUseCase {
  const GetPagesUseCase(this._repository);

  final PagesRepository _repository;

  Future<Either<Failure, List<PageEntity>>> call() => _repository.getPages();
}
