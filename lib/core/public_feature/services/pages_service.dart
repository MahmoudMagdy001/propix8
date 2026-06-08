import 'package:propix8/core/models/page_model.dart';
import 'package:propix8/core/models/stat_model.dart';
import 'package:propix8/core/network/dio_client.dart';

class PagesService {
  PagesService(this._dioClient);
  final DioClient _dioClient;

  Future<List<PageModel>> getPages() async {
    try {
      final response = await _dioClient.get('/pages');
      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] as List<dynamic>?;
      if (data == null) return [];
      return data
          .map((e) => PageModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<StatModel>> getStats() async {
    try {
      final response = await _dioClient.get('/stats');
      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] as List<dynamic>?;
      if (data == null) return [];
      return data
          .map((e) => StatModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
