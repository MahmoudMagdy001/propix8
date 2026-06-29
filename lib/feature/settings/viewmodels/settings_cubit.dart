import 'dart:async';

import 'package:flutter/material.dart';
import 'package:propix8/core/public_feature/services/storage_service.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/settings/repositories/settings_repository.dart';
import 'package:propix8/feature/settings/viewmodels/settings_state.dart';

class SettingsCubit extends SafeCubit<SettingsState> {
  SettingsCubit(this._storageService, this._settingsRepository)
    : super(const SettingsState()) {
    unawaited(_loadSettings());
    // NOTE: loadSiteSettings() is NOT called here.
    // It should only be called when user navigates to onboarding screen
    // to avoid unnecessary API calls for logged-in users.
  }
  final StorageService _storageService;
  final SettingsRepository _settingsRepository;

  Future<void> _loadSettings() async {
    // Keep existing implementation but don't emit success/failure for local settings to avoid overwriting remote status if loading concurrently?
    // Actually, local settings are fast. Remote is slow.
    // Let's just do them.
    emit(state.copyWith(status: SettingsStatus.loading));
    try {
      final savedTheme = _storageService.getThemeMode();
      final savedLocale = _storageService.getLocale();

      var themeMode = ThemeMode.system;
      if (savedTheme != null) {
        themeMode = ThemeMode.values.firstWhere(
          (e) => e.toString() == savedTheme,
          orElse: () => ThemeMode.system,
        );
      }

      emit(
        state.copyWith(
          status: SettingsStatus.success,
          themeMode: themeMode,
          locale: Locale(savedLocale),
        ),
      );
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: SettingsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> loadSiteSettings() async {
    // Don't set loading here to avoid conflicting with local settings load causing flicker?
    // Or maybe we want to know if it's loading.
    // For now, let's just fetch and update.
    final result = await _settingsRepository.getSiteSettings();
    if (isClosed) return;
    result.fold(
      (error) {
        // Silently fail or log? For now, we update error message but maybe keep status success if local settings worked?
        emit(state.copyWith(errorMessage: error));
      },
      (settings) {
        emit(state.copyWith(siteSettings: settings));
      },
    );
  }

  Future<void> updateTheme(ThemeMode themeMode) async {
    try {
      await _storageService.saveThemeMode(themeMode.toString());
      if (isClosed) return;
      emit(state.copyWith(themeMode: themeMode));
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: SettingsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> updateLocale(Locale locale) async {
    try {
      await _storageService.saveLocale(locale.languageCode);
      if (isClosed) return;
      emit(state.copyWith(locale: locale));
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: SettingsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
