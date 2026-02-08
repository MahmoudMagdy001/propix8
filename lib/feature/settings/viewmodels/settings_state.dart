import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/site_settings_model.dart';

enum SettingsStatus { initial, loading, success, failure }

class SettingsState extends Equatable {
  const SettingsState({
    this.status = SettingsStatus.initial,
    this.themeMode = ThemeMode.system,
    this.locale = const Locale('ar'),
    this.siteSettings,
    this.errorMessage,
  });
  final SettingsStatus status;
  final ThemeMode themeMode;
  final Locale locale;
  final SiteSettingsModel? siteSettings;
  final String? errorMessage;

  SettingsState copyWith({
    SettingsStatus? status,
    ThemeMode? themeMode,
    Locale? locale,
    SiteSettingsModel? siteSettings,
    String? errorMessage,
  }) => SettingsState(
    status: status ?? this.status,
    themeMode: themeMode ?? this.themeMode,
    locale: locale ?? this.locale,
    siteSettings: siteSettings ?? this.siteSettings,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [
    status,
    themeMode,
    locale,
    siteSettings,
    errorMessage,
  ];
}
