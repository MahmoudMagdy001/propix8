import 'package:flutter/material.dart';
import 'package:propix8/feature/settings/domain/repositories/settings_repository.dart';

class SaveLocaleUseCase {
  const SaveLocaleUseCase(this._repository);

  final SettingsRepository _repository;

  Future<void> call(Locale locale) => _repository.saveLocale(locale);
}
