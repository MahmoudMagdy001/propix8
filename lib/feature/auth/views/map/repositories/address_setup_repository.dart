import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/services/storage_service.dart';
import '../../../models/auth_model.dart';
import '../models/city_model.dart';
import '../services/address_setup_service.dart';

abstract class AddressSetupRepository {
  Future<Either<String, List<City>>> getCities();
  Future<Either<String, User>> updateProfile({
    required int cityId,
    required String address,
  });
  Future<Either<String, User>> getProfile();
}

class AddressSetupRepositoryImpl implements AddressSetupRepository {
  AddressSetupRepositoryImpl(this._addressSetupService, this._storageService);
  final AddressSetupService _addressSetupService;
  final StorageService _storageService;

  @override
  Future<Either<String, List<City>>> getCities() async {
    try {
      final cities = await _addressSetupService.getCities();
      return Right(cities);
    } on DioException catch (e) {
      return Left(
        (e.response?.data as Map<String, dynamic>?)?['message']?.toString() ??
            'Failed to fetch cities',
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User>> updateProfile({
    required int cityId,
    required String address,
  }) async {
    try {
      final user = await _addressSetupService.updateProfile(
        cityId: cityId,
        address: address,
      );
      // Cache user data for fast startup
      await _storageService.saveUser(user.toJson());
      return Right(user);
    } on DioException catch (e) {
      return Left(
        (e.response?.data as Map<String, dynamic>?)?['message']?.toString() ??
            'Failed to update profile',
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User>> getProfile() async {
    try {
      final user = await _addressSetupService.getProfile();
      // Cache user data for fast startup
      await _storageService.saveUser(user.toJson());
      return Right(user);
    } on DioException catch (e) {
      return Left(
        (e.response?.data as Map<String, dynamic>?)?['message']?.toString() ??
            'Failed to fetch profile',
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
