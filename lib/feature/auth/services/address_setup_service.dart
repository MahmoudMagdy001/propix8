import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/auth/models/auth_model.dart';
import 'package:propix8/feature/auth/models/city_model.dart';

class AddressSetupService {
  AddressSetupService(this._dioClient);
  final DioClient _dioClient;

  Future<List<City>> getCities() async {
    final response = await _dioClient.get('cities');
    final data =
        ((response.data as Map<String, dynamic>)['data'] as List?) ?? [];
    return data
        .map((json) => City.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<User> updateProfile({
    required int cityId,
    required String address,
  }) async {
    final response = await _dioClient.post(
      'profile',
      data: {'city_id': cityId, 'address': address, '_method': 'PUT'},
    );
    final resData = response.data as Map<String, dynamic>;
    final innerData = resData['data'] as Map<String, dynamic>?;

    if (innerData != null && innerData['user'] != null) {
      return User.fromJson(innerData['user'] as Map<String, dynamic>);
    }
    if (innerData != null) {
      return User.fromJson(innerData);
    }
    throw Exception('Invalid profile update response');
  }

  Future<User> getProfile() async {
    final response = await _dioClient.get('profile');
    return User.fromJson(
      (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
    );
  }
}
