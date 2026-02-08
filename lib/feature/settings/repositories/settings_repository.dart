import 'package:dartz/dartz.dart';

import '../models/site_settings_model.dart';
import '../services/settings_service.dart';

abstract class SettingsRepository {
  Future<Either<String, SiteSettingsModel>> getSiteSettings();
}

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._service);
  final SettingsService _service;

  @override
  Future<Either<String, SiteSettingsModel>> getSiteSettings() async {
    try {
      final result = await _service.getSiteSettings();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
