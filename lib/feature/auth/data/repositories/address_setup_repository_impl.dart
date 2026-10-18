import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/functional/result.dart';
import 'package:propix8/core/storage/storage_service.dart';
import 'package:propix8/feature/auth/data/datasources/address_setup_remote_data_source.dart';
import 'package:propix8/feature/auth/domain/entities/city_entity.dart';
import 'package:propix8/feature/auth/domain/entities/user_entity.dart';
import 'package:propix8/feature/auth/domain/repositories/address_setup_repository.dart';

class AddressSetupRepositoryImpl implements AddressSetupRepository {
  AddressSetupRepositoryImpl(this._remoteDataSource, this._storageService);
  final AddressSetupRemoteDataSource _remoteDataSource;
  final StorageService _storageService;

  @override
  ResultFuture<List<City>> getCities() async {
    try {
      final cities = await _remoteDataSource.getCities();
      return Right(cities);
    } on DioException catch (e) {
      final message =
          (e.response?.data as Map<String, dynamic>?)?['message']?.toString() ??
          'Failed to fetch cities';
      return Left(ServerFailure(message, e.response?.statusCode));
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultFuture<User> updateProfile({
    required int cityId,
    required String address,
  }) async {
    try {
      final user = await _remoteDataSource.updateProfile(
        cityId: cityId,
        address: address,
      );
      await _storageService.saveUser(user.toJson());
      return Right(user);
    } on DioException catch (e) {
      final message =
          (e.response?.data as Map<String, dynamic>?)?['message']?.toString() ??
          'Failed to update profile';
      return Left(ServerFailure(message, e.response?.statusCode));
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultFuture<User> getProfile() async {
    try {
      final user = await _remoteDataSource.getProfile();
      await _storageService.saveUser(user.toJson());
      return Right(user);
    } on DioException catch (e) {
      final message =
          (e.response?.data as Map<String, dynamic>?)?['message']?.toString() ??
          'Failed to fetch profile';
      return Left(ServerFailure(message, e.response?.statusCode));
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
