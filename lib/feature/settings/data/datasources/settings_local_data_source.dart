import 'package:flutter/material.dart';
import 'package:propix8/core/storage/storage_service.dart';

abstract interface class SettingsLocalDataSource {
  ThemeMode getThemeMode();
  Future<void> saveThemeMode(ThemeMode themeMode);
  Locale getLocale();
  Future<void> saveLocale(Locale locale);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  const SettingsLocalDataSourceImpl(this._storageService);

  final StorageService _storageService;

  @override
  ThemeMode getThemeMode() {
    final savedTheme = _storageService.getThemeMode();
    if (savedTheme == null) return ThemeMode.system;
    return ThemeMode.values.firstWhere(
      (e) => e.toString() == savedTheme,
      orElse: () => ThemeMode.system,
    );
  }

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) =>
      _storageService.saveThemeMode(themeMode.toString());

  @override
  Locale getLocale() {
    final savedLocale = _storageService.getLocale();
    return Locale(savedLocale);
  }

  @override
  Future<void> saveLocale(Locale locale) =>
      _storageService.saveLocale(locale.languageCode);
}
