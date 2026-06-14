import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:propix8/core/public_feature/services/storage_service.dart';
import 'package:propix8/feature/auth/models/auth_model.dart';
import 'package:propix8/feature/auth/models/city_model.dart';
import 'package:propix8/feature/profile/services/user_profile_service.dart';

abstract class UserProfileRepository {
  Future<Either<String, User>> getProfile({bool forceRefresh = false});
  Future<Either<String, User>> updateProfile(
    Map<String, dynamic> data, {
    String? avatarPath,
  });
  Future<Either<String, List<City>>> getCities();
  Future<Either<String, void>> deleteProfile();
}

class UserProfileRepositoryImpl implements UserProfileRepository {
  UserProfileRepositoryImpl(this._service, this._storageService);
  final UserProfileService _service;
  final StorageService _storageService;

  @override
  Future<Either<String, void>> deleteProfile() async {
    try {
      await _service.deleteProfile();
      await _storageService.clearAuthData();
      return const Right(null);
    } on DioException catch (e) {
      // If server returns 401, the session is already invalid on server.
      // Clear locally to prevent being stuck.
      if (e.response?.statusCode == 401) {
        await _storageService.clearAuthData();
      }
      return Left(_handleError(e, 'Failed to delete profile'));
    } on Object catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<City>>> getCities() async {
    try {
      final cities = await _service.getCities();
      return Right(cities);
    } on DioException catch (e) {
      return Left(_handleError(e, 'Failed to fetch cities'));
    } on Object catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User>> getProfile({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cachedJson = _storageService.getUser();
      if (cachedJson != null) {
        try {
          return Right(User.fromJson(cachedJson));
        } on Object catch (_) {}
      }
    }

    try {
      final user = await _service.getProfile();
      await _storageService.saveUser(user.toJson());
      return Right(user);
    } on DioException catch (e) {
      return Left(_handleError(e, 'Failed to load profile'));
    } on Object catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User>> updateProfile(
    Map<String, dynamic> data, {
    String? avatarPath,
  }) async {
    try {
      final user = await _service.updateProfile(data, avatarPath: avatarPath);
      await _storageService.saveUser(user.toJson());
      return Right(user);
    } on DioException catch (e) {
      return Left(_handleError(e, 'Failed to update profile'));
    } on Object catch (e) {
      return Left(e.toString());
    }
  }

  String _handleError(DioException e, String defaultMessage) {
    if (e.response?.data != null && e.response!.data is Map) {
      final data = e.response!.data as Map<String, dynamic>;
      if (data['message'] != null) return data['message'].toString();
      if (data['errors'] != null && data['errors'] is Map) {
        return data['message']?.toString() ?? defaultMessage;
      }
    }
    return e.message ?? defaultMessage;
  }
}
