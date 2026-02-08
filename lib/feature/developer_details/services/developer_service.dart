import '../../../core/network/dio_client.dart';

class DeveloperService {
  DeveloperService(this._dioClient);
  final DioClient _dioClient;

  Future<Map<String, dynamic>> getDeveloperUnits(int id, {int? page}) async {
    try {
      final response = await _dioClient.get(
        'developers/$id',
        queryParameters: page != null ? {'page': page} : null,
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
