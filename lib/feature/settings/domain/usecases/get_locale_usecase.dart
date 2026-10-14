import 'package:flutter/material.dart';
import 'package:propix8/feature/settings/domain/repositories/settings_repository.dart';

class GetLocaleUseCase {
  const GetLocaleUseCase(this._repository);

  final SettingsRepository _repository;

  Locale call() => _repository.getLocale();
}
