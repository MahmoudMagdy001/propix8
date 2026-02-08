import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_state_manager/internet_state_manager.dart';

import 'core/di/locator.dart';
import 'core/router/app_router.dart';
import 'core/public_feature/services/deep_link_service.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/auth_constants.dart';
import 'core/utils/auth_logger.dart';
import 'feature/auth/viewmodels/auth_cubit.dart';
import 'feature/favorites/viewmodels/favorite_cubit.dart';
import 'feature/settings/viewmodels/settings_cubit.dart';
import 'feature/settings/viewmodels/settings_state.dart';
import 'l10n/app_localizations.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await setupLocator();
  AuthLogger.info('DI setup complete');

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  await InternetStateManagerInitializer.initialize();

  try {
    await locator<AuthCubit>().checkAuthStatus().timeout(
      AuthConstants.authCheckTimeout,
    );
    AuthLogger.info('Auth check completed');
  } catch (e) {
    AuthLogger.error('Auth check timed out or failed', e);
  }

  // Initialize Deep Link Service
  // This must be done after Auth check so we know the initial auth state
  // for handling cold start deep links correctly.
  await locator<DeepLinkService>().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<FavoriteCubit>()),
        BlocProvider(create: (context) => locator<AuthCubit>()),
        BlocProvider(create: (context) => locator<SettingsCubit>()),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) => Theme(
          data: state.themeMode == ThemeMode.dark
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
          child: Builder(
            builder: (context) => MaterialApp.router(
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              onGenerateTitle: (context) =>
                  AppLocalizations.of(context)!.appTitle,

              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: state.themeMode,

              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('ar', ''), Locale('en', '')],
              locale: state.locale,

              builder: (context, child) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  FlutterNativeSplash.remove();
                });
                return MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: TextScaler.noScaling),
                  child: InternetStateManagerInitializer(
                    options: InternetStateOptions(
                      checkConnectionPeriodic: const Duration(seconds: 5),
                      labels: InternetStateLabels(
                        noInternetTitle: () =>
                            AppLocalizations.of(context)!.noInternetTitle,
                        descriptionText: () =>
                            AppLocalizations.of(context)!.noInternetSubtitle,
                        tryAgainText: () =>
                            AppLocalizations.of(context)!.tryAgainText,
                      ),
                    ),
                    child: child!,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ),
  );
}
