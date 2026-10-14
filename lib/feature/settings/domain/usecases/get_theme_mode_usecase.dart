import 'package:flutter/material.dart';
import 'package:propix8/feature/settings/domain/repositories/settings_repository.dart';

class GetThemeModeUseCase {
  const GetThemeModeUseCase(this._repository);

  final SettingsRepository _repository;

  ThemeMode call() => _repository.getThemeMode();
}
