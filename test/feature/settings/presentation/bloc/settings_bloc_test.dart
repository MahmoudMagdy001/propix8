import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/settings/domain/entities/site_settings_entity.dart';
import 'package:propix8/feature/settings/domain/usecases/get_locale_usecase.dart';
import 'package:propix8/feature/settings/domain/usecases/get_site_settings_usecase.dart';
import 'package:propix8/feature/settings/domain/usecases/get_theme_mode_usecase.dart';
import 'package:propix8/feature/settings/domain/usecases/save_locale_usecase.dart';
import 'package:propix8/feature/settings/domain/usecases/save_theme_mode_usecase.dart';
import 'package:propix8/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:propix8/feature/settings/presentation/bloc/settings_event.dart';
import 'package:propix8/feature/settings/presentation/bloc/settings_state.dart';

class MockGetSiteSettingsUseCase extends Mock
    implements GetSiteSettingsUseCase {}

class MockGetThemeModeUseCase extends Mock implements GetThemeModeUseCase {}

class MockSaveThemeModeUseCase extends Mock implements SaveThemeModeUseCase {}

class MockGetLocaleUseCase extends Mock implements GetLocaleUseCase {}

class MockSaveLocaleUseCase extends Mock implements SaveLocaleUseCase {}

void main() {
  late MockGetSiteSettingsUseCase mockGetSiteSettingsUseCase;
  late MockGetThemeModeUseCase mockGetThemeModeUseCase;
  late MockSaveThemeModeUseCase mockSaveThemeModeUseCase;
  late MockGetLocaleUseCase mockGetLocaleUseCase;
  late MockSaveLocaleUseCase mockSaveLocaleUseCase;

  setUp(() {
    mockGetSiteSettingsUseCase = MockGetSiteSettingsUseCase();
    mockGetThemeModeUseCase = MockGetThemeModeUseCase();
    mockSaveThemeModeUseCase = MockSaveThemeModeUseCase();
    mockGetLocaleUseCase = MockGetLocaleUseCase();
    mockSaveLocaleUseCase = MockSaveLocaleUseCase();

    when(() => mockGetThemeModeUseCase()).thenReturn(ThemeMode.system);
    when(() => mockGetLocaleUseCase()).thenReturn(const Locale('en'));
  });

  SettingsBloc buildBloc() => SettingsBloc(
    getSiteSettingsUseCase: mockGetSiteSettingsUseCase,
    getThemeModeUseCase: mockGetThemeModeUseCase,
    saveThemeModeUseCase: mockSaveThemeModeUseCase,
    getLocaleUseCase: mockGetLocaleUseCase,
    saveLocaleUseCase: mockSaveLocaleUseCase,
  );

  test('initial state and startup loads themeMode and locale', () async {
    final bloc = buildBloc();
    await Future<void>.delayed(const Duration(milliseconds: 10));

    expect(bloc.state.status, equals(SettingsStatus.success));
    expect(bloc.state.themeMode, equals(ThemeMode.system));
    expect(bloc.state.locale, equals(const Locale('en')));
    await bloc.close();
  });

  group('SiteSettingsRequested event', () {
    const tSiteSettings = SiteSettingsEntity(
      siteName: 'ProPix',
      siteEmail: 'info@propix.com',
      sitePhone: '123456789',
      siteAddress: '123 Street',
      socialFacebook: 'fb.com',
      socialTwitter: 'tw.com',
      socialInstagram: 'ig.com',
      homeHeroImages: ['img1.jpg'],
    );
    const tFailure = ServerFailure('Failed to load site settings');

    blocTest<SettingsBloc, SettingsState>(
      'emits state with siteSettings when getSiteSettings succeeds',
      build: () {
        when(
          () => mockGetSiteSettingsUseCase(),
        ).thenAnswer((_) async => const Right(tSiteSettings));
        return buildBloc();
      },
      act: (bloc) => bloc.add(const SettingsEvent.siteSettingsRequested()),
      expect: () => [
        const SettingsState(status: SettingsStatus.loading),
        const SettingsState(
          status: SettingsStatus.success,
          locale: Locale('en'),
        ),
        const SettingsState(
          status: SettingsStatus.success,
          locale: Locale('en'),
          siteSettings: tSiteSettings,
        ),
      ],
      verify: (_) {
        verify(() => mockGetSiteSettingsUseCase()).called(1);
      },
    );

    blocTest<SettingsBloc, SettingsState>(
      'emits state with errorMessage when getSiteSettings fails',
      build: () {
        when(
          () => mockGetSiteSettingsUseCase(),
        ).thenAnswer((_) async => const Left(tFailure));
        return buildBloc();
      },
      act: (bloc) => bloc.add(const SettingsEvent.siteSettingsRequested()),
      expect: () => [
        const SettingsState(status: SettingsStatus.loading),
        const SettingsState(
          status: SettingsStatus.success,
          locale: Locale('en'),
        ),
        const SettingsState(
          status: SettingsStatus.success,
          locale: Locale('en'),
          errorMessage: 'Failed to load site settings',
        ),
      ],
    );
  });

  group('ThemeChanged event', () {
    blocTest<SettingsBloc, SettingsState>(
      'saves theme and emits updated themeMode',
      build: () {
        when(
          () => mockSaveThemeModeUseCase(ThemeMode.dark),
        ).thenAnswer((_) async {});
        return buildBloc();
      },
      act: (bloc) => bloc.add(const SettingsEvent.themeChanged(ThemeMode.dark)),
      expect: () => [
        const SettingsState(status: SettingsStatus.loading),
        const SettingsState(
          status: SettingsStatus.success,
          locale: Locale('en'),
        ),
        const SettingsState(
          status: SettingsStatus.success,
          themeMode: ThemeMode.dark,
          locale: Locale('en'),
        ),
      ],
      verify: (_) {
        verify(() => mockSaveThemeModeUseCase(ThemeMode.dark)).called(1);
      },
    );
  });

  group('LocaleChanged event', () {
    blocTest<SettingsBloc, SettingsState>(
      'saves locale and emits updated locale',
      build: () {
        when(
          () => mockSaveLocaleUseCase(const Locale('ar')),
        ).thenAnswer((_) async {});
        return buildBloc();
      },
      act: (bloc) => bloc.add(const SettingsEvent.localeChanged(Locale('ar'))),
      expect: () => [
        const SettingsState(status: SettingsStatus.loading),
        const SettingsState(
          status: SettingsStatus.success,
          locale: Locale('en'),
        ),
        const SettingsState(
          status: SettingsStatus.success,
        ),
      ],
      verify: (_) {
        verify(() => mockSaveLocaleUseCase(const Locale('ar'))).called(1);
      },
    );
  });
}
