import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/settings/data/datasources/settings_local_data_source.dart';
import 'package:propix8/feature/settings/data/datasources/settings_remote_data_source.dart';
import 'package:propix8/feature/settings/domain/entities/site_settings_entity.dart';
import 'package:propix8/feature/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl({
    required SettingsRemoteDataSource remoteDataSource,
    required SettingsLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  final SettingsRemoteDataSource _remoteDataSource;
  final SettingsLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, SiteSettingsEntity>> getSiteSettings() async {
    try {
      final model = await _remoteDataSource.getSiteSettings();
      return Right(model.toDomain());
    } on DioException catch (e) {
      return Left(
        ServerFailure(e.message ?? 'Server error', e.response?.statusCode),
      );
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ThemeMode getThemeMode() => _localDataSource.getThemeMode();

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) =>
      _localDataSource.saveThemeMode(themeMode);

  @override
  Locale getLocale() => _localDataSource.getLocale();

  @override
  Future<void> saveLocale(Locale locale) => _localDataSource.saveLocale(locale);
}
