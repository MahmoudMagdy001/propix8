import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/settings/domain/entities/site_settings_entity.dart';

abstract interface class SettingsRepository {
  Future<Either<Failure, SiteSettingsEntity>> getSiteSettings();
  ThemeMode getThemeMode();
  Future<void> saveThemeMode(ThemeMode themeMode);
  Locale getLocale();
  Future<void> saveLocale(Locale locale);
}
