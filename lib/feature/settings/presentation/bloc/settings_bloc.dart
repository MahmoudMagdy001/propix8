import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/settings/domain/usecases/get_locale_usecase.dart';
import 'package:propix8/feature/settings/domain/usecases/get_site_settings_usecase.dart';
import 'package:propix8/feature/settings/domain/usecases/get_theme_mode_usecase.dart';
import 'package:propix8/feature/settings/domain/usecases/save_locale_usecase.dart';
import 'package:propix8/feature/settings/domain/usecases/save_theme_mode_usecase.dart';
import 'package:propix8/feature/settings/presentation/bloc/settings_event.dart';
import 'package:propix8/feature/settings/presentation/bloc/settings_state.dart';

class SettingsBloc extends SafeBloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required GetSiteSettingsUseCase getSiteSettingsUseCase,
    required GetThemeModeUseCase getThemeModeUseCase,
    required SaveThemeModeUseCase saveThemeModeUseCase,
    required GetLocaleUseCase getLocaleUseCase,
    required SaveLocaleUseCase saveLocaleUseCase,
  }) : _getSiteSettingsUseCase = getSiteSettingsUseCase,
       _getThemeModeUseCase = getThemeModeUseCase,
       _saveThemeModeUseCase = saveThemeModeUseCase,
       _getLocaleUseCase = getLocaleUseCase,
       _saveLocaleUseCase = saveLocaleUseCase,
       super(const SettingsState()) {
    on<SettingsStarted>(_onStarted);
    on<SiteSettingsRequested>(_onSiteSettingsRequested);
    on<ThemeChanged>(_onThemeChanged);
    on<LocaleChanged>(_onLocaleChanged);

    add(const SettingsStarted());
  }

  final GetSiteSettingsUseCase _getSiteSettingsUseCase;
  final GetThemeModeUseCase _getThemeModeUseCase;
  final SaveThemeModeUseCase _saveThemeModeUseCase;
  final GetLocaleUseCase _getLocaleUseCase;
  final SaveLocaleUseCase _saveLocaleUseCase;

  Future<void> _onStarted(
    SettingsStarted event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(status: SettingsStatus.loading));
    try {
      final themeMode = _getThemeModeUseCase();
      final locale = _getLocaleUseCase();
      emit(
        state.copyWith(
          status: SettingsStatus.success,
          themeMode: themeMode,
          locale: locale,
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

  Future<void> _onSiteSettingsRequested(
    SiteSettingsRequested event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await _getSiteSettingsUseCase();
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (siteSettings) => emit(state.copyWith(siteSettings: siteSettings)),
    );
  }

  Future<void> _onThemeChanged(
    ThemeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      await _saveThemeModeUseCase(event.themeMode);
      emit(state.copyWith(themeMode: event.themeMode));
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: SettingsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLocaleChanged(
    LocaleChanged event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      await _saveLocaleUseCase(event.locale);
      emit(state.copyWith(locale: event.locale));
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
