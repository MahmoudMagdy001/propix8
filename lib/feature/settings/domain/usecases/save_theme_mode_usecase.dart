import 'package:flutter/material.dart';
import 'package:propix8/feature/settings/domain/repositories/settings_repository.dart';

class SaveThemeModeUseCase {
  const SaveThemeModeUseCase(this._repository);

  final SettingsRepository _repository;

  Future<void> call(ThemeMode themeMode) =>
      _repository.saveThemeMode(themeMode);
}
