import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/static_pages/domain/entities/page_entity.dart';
import 'package:propix8/feature/static_pages/domain/entities/stat_entity.dart';

abstract interface class PagesRepository {
  Future<Either<Failure, List<PageEntity>>> getPages();
  Future<Either<Failure, List<StatEntity>>> getStats();
}
