import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.freezed.dart';

@freezed
sealed class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.started() = SettingsStarted;
  const factory SettingsEvent.siteSettingsRequested() = SiteSettingsRequested;
  const factory SettingsEvent.themeChanged(ThemeMode themeMode) = ThemeChanged;
  const factory SettingsEvent.localeChanged(Locale locale) = LocaleChanged;
}
