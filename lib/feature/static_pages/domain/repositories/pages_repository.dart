import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/static_pages/domain/entities/page_entity.dart';
import 'package:propix8/feature/static_pages/domain/entities/stat_entity.dart';

abstract interface class PagesRepository {
  ResultFuture<List<PageEntity>> getPages();
  ResultFuture<List<StatEntity>> getStats();
}
