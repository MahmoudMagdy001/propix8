import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/static_pages/data/datasources/pages_remote_data_source.dart';
import 'package:propix8/feature/static_pages/domain/entities/page_entity.dart';
import 'package:propix8/feature/static_pages/domain/entities/stat_entity.dart';
import 'package:propix8/feature/static_pages/domain/repositories/pages_repository.dart';

class PagesRepositoryImpl implements PagesRepository {
  const PagesRepositoryImpl(this._remoteDataSource);

  final PagesRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<PageEntity>> getPages() async {
    try {
      final models = await _remoteDataSource.getPages();
      return Right(models.map((m) => m.toDomain()).toList());
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.message ?? 'Server error occurred',
          e.response?.statusCode,
        ),
      );
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultFuture<List<StatEntity>> getStats() async {
    try {
      final models = await _remoteDataSource.getStats();
      return Right(models.map((m) => m.toDomain()).toList());
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.message ?? 'Server error occurred',
          e.response?.statusCode,
        ),
      );
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
