import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/static_pages/data/models/page_model.dart';
import 'package:propix8/feature/static_pages/data/models/stat_model.dart';

abstract interface class PagesRemoteDataSource {
  Future<List<PageModel>> getPages();
  Future<List<StatModel>> getStats();
}

class PagesRemoteDataSourceImpl implements PagesRemoteDataSource {
  const PagesRemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<List<PageModel>> getPages() async {
    final response = await _dioClient.get('/pages');
    final responseData = response.data as Map<String, dynamic>;
    final data = responseData['data'] as List<dynamic>?;
    if (data == null) return [];
    return data
        .map((e) => PageModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<StatModel>> getStats() async {
    final response = await _dioClient.get('/stats');
    final responseData = response.data as Map<String, dynamic>;
    final data = responseData['data'] as List<dynamic>?;
    if (data == null) return [];
    return data
        .map((e) => StatModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
