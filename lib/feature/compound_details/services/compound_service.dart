import 'package:propix8/core/network/dio_client.dart';

class CompoundService {
  CompoundService(this._dioClient);
  final DioClient _dioClient;

  Future<Map<String, dynamic>> getCompoundUnits(int id, {int? page}) async {
    try {
      final response = await _dioClient.get(
        'compounds/$id',
        queryParameters: {'page': ?page},
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
