import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/functional/result.dart';
import 'package:propix8/core/storage/storage_service.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/auth/data/models/city_model.dart';
import 'package:propix8/feature/profile/data/datasources/user_profile_remote_data_source.dart';
import 'package:propix8/feature/profile/domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  UserProfileRepositoryImpl(this._remoteDataSource, this._storageService);
  final UserProfileRemoteDataSource _remoteDataSource;
  final StorageService _storageService;

  @override
  ResultUnit deleteProfile() async {
    try {
      await _remoteDataSource.deleteProfile();
      await _storageService.clearAuthData();
      return const Right(unit);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await _storageService.clearAuthData();
      }
      return Left(ServerFailure(_handleError(e, 'Failed to delete profile')));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ResultFuture<List<City>> getCities() async {
    try {
      final cities = await _remoteDataSource.getCities();
      return Right(cities);
    } on DioException catch (e) {
      return Left(ServerFailure(_handleError(e, 'Failed to fetch cities')));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ResultFuture<User> getProfile({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cachedJson = _storageService.getUser();
      if (cachedJson != null) {
        try {
          return Right(User.fromJson(cachedJson));
        } on Object catch (_) {}
      }
    }

    try {
      final user = await _remoteDataSource.getProfile();
      await _storageService.saveUser(user.toJson());
      return Right(user);
    } on DioException catch (e) {
      return Left(ServerFailure(_handleError(e, 'Failed to load profile')));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ResultFuture<User> updateProfile(
    Map<String, dynamic> data, {
    String? avatarPath,
  }) async {
    try {
      final user = await _remoteDataSource.updateProfile(
        data,
        avatarPath: avatarPath,
      );
      await _storageService.saveUser(user.toJson());
      return Right(user);
    } on DioException catch (e) {
      return Left(ServerFailure(_handleError(e, 'Failed to update profile')));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
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
