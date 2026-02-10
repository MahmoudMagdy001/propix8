import 'package:dio/dio.dart';

import '../../../core/network/dio_client.dart';
import '../../auth/models/auth_model.dart';
import '../../auth/models/city_model.dart';

class UserProfileService {
  UserProfileService(this._dioClient);
  final DioClient _dioClient;

  Future<User> getProfile() async {
    final response = await _dioClient.get('profile');
    final data = response.data as Map<String, dynamic>;
    if (data['data'] != null) {
      return User.fromJson(data['data'] as Map<String, dynamic>);
    }
    throw Exception('Invalid profile response format');
  }

  Future<User> updateProfile(
    Map<String, dynamic> data, {
    String? avatarPath,
  }) async {
    final formData = FormData.fromMap({'_method': 'PUT', ...data});

    if (avatarPath != null) {
      formData.files.add(
        MapEntry('avatar', await MultipartFile.fromFile(avatarPath)),
      );
    }

    // Increase timeout for file uploads
    final options = Options(
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );

    final response = await _dioClient.post(
      'profile',
      data: formData,
      options: options,
    );
    final resData = response.data as Map<String, dynamic>;
    final innerData = resData['data'] as Map<String, dynamic>?;

    if (innerData != null && innerData['user'] != null) {
      return User.fromJson(innerData['user'] as Map<String, dynamic>);
    }
    // Fallback if the structure is different or just 'data' contains the user
    if (innerData != null) {
      return User.fromJson(innerData);
    }

    throw Exception('Invalid profile update response');
  }

  Future<List<City>> getCities() async {
    final response = await _dioClient.get('cities');
    final List<dynamic> data =
        (response.data as Map<String, dynamic>)['data'] ?? [];
    return data
        .map((json) => City.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<void> deleteProfile() async {
    try {
      await _dioClient.delete('profile');
    } catch (e) {
      rethrow;
    }
  }
}
