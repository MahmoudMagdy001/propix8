import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:propix8/core/models/page_model.dart';
import 'package:propix8/core/models/stat_model.dart';
import 'package:propix8/core/public_feature/services/pages_service.dart';

abstract class PagesRepository {
  Future<Either<String, List<PageModel>>> getPages();
  Future<Either<String, List<StatModel>>> getStats();
}

class PagesRepositoryImpl implements PagesRepository {
  PagesRepositoryImpl(this._service);
  final PagesService _service;

  @override
  Future<Either<String, List<PageModel>>> getPages() async {
    try {
      final pages = await _service.getPages();
      return Right(pages);
    } on DioException catch (e) {
      return Left(e.message ?? 'Unknown Dio error');
    } on Object catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<StatModel>>> getStats() async {
    try {
      final stats = await _service.getStats();
      return Right(stats);
    } on DioException catch (e) {
      return Left(e.message ?? 'Unknown Dio error');
    } on Object catch (e) {
      return Left(e.toString());
    }
  }
}
