import 'package:flutter/material.dart';
import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/settings/domain/entities/site_settings_entity.dart';

abstract interface class SettingsRepository {
  ResultFuture<SiteSettingsEntity> getSiteSettings();
  ThemeMode getThemeMode();
  Future<void> saveThemeMode(ThemeMode themeMode);
  Locale getLocale();
  Future<void> saveLocale(Locale locale);
}
