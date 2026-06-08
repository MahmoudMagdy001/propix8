import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/developers/models/developer_model.dart';

class DevelopersService {
  DevelopersService(this._dioClient);
  final DioClient _dioClient;

  Future<DeveloperResponse> getDevelopers() async {
    try {
      final response = await _dioClient.get('developers');
      return DeveloperResponse.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
