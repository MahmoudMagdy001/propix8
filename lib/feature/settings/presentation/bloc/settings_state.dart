import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/settings/domain/entities/site_settings_entity.dart';

part 'settings_state.freezed.dart';

enum SettingsStatus { initial, loading, success, failure }

@freezed
abstract class SettingsState with _$SettingsState {
  const SettingsState._();

  const factory SettingsState({
    @Default(SettingsStatus.initial) SettingsStatus status,
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(Locale('ar')) Locale locale,
    SiteSettingsEntity? siteSettings,
    String? errorMessage,
  }) = _SettingsState;
}
