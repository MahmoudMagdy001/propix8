import 'package:dio/dio.dart';
import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/auth/data/models/city_model.dart';

abstract class UserProfileRemoteDataSource {
  Future<User> getProfile();
  Future<User> updateProfile(
    Map<String, dynamic> data, {
    String? avatarPath,
  });
  Future<List<City>> getCities();
  Future<void> deleteProfile();
}

class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  const UserProfileRemoteDataSourceImpl(this._dioClient);
  final DioClient _dioClient;

  @override
  Future<User> getProfile() async {
    final response = await _dioClient.get('profile');
    final data = response.data as Map<String, dynamic>;
    if (data['data'] != null) {
      return User.fromJson(data['data'] as Map<String, dynamic>);
    }
    throw Exception('Invalid profile response format');
  }

  @override
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
    if (innerData != null) {
      return User.fromJson(innerData);
    }

    throw Exception('Invalid profile update response');
  }

  @override
  Future<List<City>> getCities() async {
    final response = await _dioClient.get('cities');
    final data =
        ((response.data as Map<String, dynamic>)['data'] as List?) ?? [];
    return data
        .map((json) => City.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> deleteProfile() async {
    await _dioClient.delete('profile');
  }
}
