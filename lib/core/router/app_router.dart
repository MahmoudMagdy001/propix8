import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/locator.dart';
import '../../feature/auth/models/auth_model.dart';
import '../../feature/auth/viewmodels/auth_cubit.dart';
import '../../feature/auth/viewmodels/auth_state.dart';
import '../../feature/auth/views/address_setup_view.dart';
import '../../feature/auth/views/email_verification_handler.dart';
import '../../feature/auth/views/forgot_password_screen.dart';
import '../../feature/auth/views/login_screen.dart';
import '../../feature/auth/views/reset_password_screen.dart';
import '../../feature/auth/views/signup_screen.dart';
import '../../feature/auth/views/widgets/password_success_screen.dart';
import '../../feature/bookings/views/bookings_view.dart';
import '../../feature/comparison/views/choose_product_view.dart';
import '../../feature/comparison/views/comparison_view.dart';
import '../../feature/compound_details/views/compound_units_view.dart';
import '../../feature/compounds/views/compounds_view.dart';
import '../../feature/developer_details/views/developer_units_view.dart';
import '../../feature/developers/views/developers_view.dart';
import '../../feature/favorites/views/favorites_view.dart';
import '../../feature/home/views/show_all_nearby_view.dart';
import '../../feature/layout/layout_view.dart';
import '../../feature/maintenance_bookings/views/maintenance_bookings_view.dart';
import '../../feature/onboarding/views/onboarding_view.dart';
import '../../feature/onboarding/views/splash_view.dart';
import '../../feature/our_services/views/our_services_view.dart';
import '../../feature/profile/viewmodels/user_profile_cubit.dart';
import '../../feature/profile/views/change_password_view.dart';
import '../../feature/profile/views/edit_account_view.dart';
import '../../feature/profile/views/edit_profile_data_view.dart';
import '../../feature/profile/views/my_testimonials_view.dart';
import '../../feature/search/views/search_view.dart';
import '../../feature/settings/viewmodels/settings_cubit.dart';
import '../../feature/settings/viewmodels/settings_state.dart';
import '../../feature/settings/views/settings_view.dart';
import '../../feature/unit_details/views/unit_details_view.dart';
import '../../feature/unit_details/views/unit_map_view.dart';
import '../public_feature/about_us/about_us_screen.dart';
import '../public_feature/privacy_policy_screen.dart';
import '../public_feature/services/storage_service.dart';
import '../public_feature/terms_and_conditions_screen.dart';
import 'app_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splashPath,
    refreshListenable: GoRouterRefreshStream(
      [locator<AuthCubit>().stream, locator<SettingsCubit>().stream],
      initialAuthStatus: locator<AuthCubit>().state.authenticationStatus,
      initialHasCity: locator<AuthCubit>().state.user?.cityId != null,
      initialLocale: locator<SettingsCubit>().state.locale.languageCode,
    ),
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.onboardingPath,
        name: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: AppRoutes.splashPath,
        name: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.loginPath,
        name: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
            path: 'forgot-password',
            name: AppRoutes.forgotPassword,
            builder: (context, state) => const ForgotPasswordScreen(),
          ),
          GoRoute(
            path: 'api/password/verify/:token',
            name: AppRoutes.resetPasswordVerification,
            builder: (context, state) {
              final token = state.pathParameters['token']!;
              final email = state.uri.queryParameters['email'] ?? '';
              return ResetPasswordScreen(token: token, email: email);
            },
          ),
          GoRoute(
            path: 'password-success',
            name: AppRoutes.passwordSuccess,
            builder: (context, state) => const PasswordSuccessScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.registerPath,
        name: AppRoutes.register,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        redirect: (context, state) => AppRoutes.forgotPasswordPath,
      ),

      GoRoute(
        path: AppRoutes.layoutPath,
        name: AppRoutes.layout,
        builder: (context, state) => LayoutView(
          key: ValueKey(
            context.read<SettingsCubit>().state.locale.languageCode,
          ),
        ),
        routes: [
          GoRoute(
            path: 'property-details/:id',
            name: AppRoutes.propertyDetails,
            builder: (context, state) {
              final id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
              return UnitDetailsView(unitId: id);
            },
          ),
          GoRoute(
            path: 'bookings',
            name: AppRoutes.bookings,
            builder: (context, state) => const BookingsView(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.legacyPropertyDetailsPath,
        redirect: (context, state) =>
            '/layout/property-details/${state.pathParameters['id']}',
      ),
      GoRoute(
        path: AppRoutes.legacyBookingsPath,
        redirect: (context, state) => AppRoutes.bookingsPath,
      ),
      GoRoute(
        path: AppRoutes.oldBookingsPath,
        redirect: (context, state) => AppRoutes.bookingsPath,
      ),
      GoRoute(
        path: '/booking',
        redirect: (context, state) => AppRoutes.bookingsPath,
      ),
      GoRoute(
        path: AppRoutes.legacyResetPasswordVerificationPath,
        redirect: (context, state) {
          final token = state.pathParameters['token'];
          final email = state.uri.queryParameters['email'];
          return '/login/api/password/verify/$token?email=$email';
        },
      ),
      GoRoute(
        path: AppRoutes.citySelectPath,
        name: AppRoutes.citySelect,
        builder: (context, state) => const ProfileSetupScreen(),
      ),
      GoRoute(
        path: AppRoutes.emailVerificationPath,
        name: AppRoutes.emailVerification,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final hash = state.pathParameters['hash']!;
          final queryParams = state.uri.queryParameters;
          return EmailVerificationHandler(
            id: id,
            hash: hash,
            queryParams: queryParams,
          );
        },
      ),

      // Profile sub-routes - ProfileView is only in LayoutView (tab 3)
      // These are standalone routes that get UserProfileCubit from locator
      GoRoute(
        path: AppRoutes.editAccountPath,
        name: AppRoutes.editAccount,
        builder: (context, state) => BlocProvider.value(
          value: locator<UserProfileCubit>(),
          child: const EditAccountView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.editProfileDataPath,
        name: AppRoutes.editProfileData,
        builder: (context, state) => BlocProvider.value(
          value: locator<UserProfileCubit>(),
          child: const EditProfileDataView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.changePasswordPath,
        name: AppRoutes.changePassword,
        builder: (context, state) => BlocProvider.value(
          value: locator<UserProfileCubit>(),
          child: const ChangePasswordView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.settingsPath,
        name: AppRoutes.settings,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: AppRoutes.developersPath,
        name: AppRoutes.developers,
        builder: (context, state) => const DevelopersView(),
      ),
      GoRoute(
        path: AppRoutes.compoundsPath,
        name: AppRoutes.compounds,
        builder: (context, state) => const CompoundsView(),
      ),
      GoRoute(
        path: AppRoutes.favoritesPath,
        name: AppRoutes.favorites,
        builder: (context, state) => const FavoritesView(),
      ),
      GoRoute(
        path: AppRoutes.mapPath,
        name: AppRoutes.map,
        builder: (context, state) => const ProfileSetupScreen(),
      ),

      GoRoute(
        path: AppRoutes.ourServicesPath,
        name: AppRoutes.ourServices,
        builder: (context, state) => const OurServicesView(),
      ),
      GoRoute(
        path: AppRoutes.maintenanceBookingPath,
        name: AppRoutes.maintenanceBooking,
        builder: (context, state) => const MaintenanceBookingsView(),
      ),
      GoRoute(
        path: AppRoutes.termsPath,
        name: AppRoutes.terms,
        builder: (context, state) => const TermsAndConditionsScreen(),
      ),
      GoRoute(
        path: AppRoutes.privacyPath,
        name: AppRoutes.privacy,
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: AppRoutes.aboutUsPath,
        name: AppRoutes.aboutUs,
        builder: (context, state) => const AboutUsScreen(),
      ),
      GoRoute(
        path: AppRoutes.myTestimonialsPath,
        name: AppRoutes.myTestimonials,
        builder: (context, state) => const MyTestimonialsView(),
      ),
      GoRoute(
        path: AppRoutes.searchPath,
        name: AppRoutes.search,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: AppRoutes.nearbyPropertiesPath,
        name: AppRoutes.nearbyProperties,
        builder: (context, state) => const ShowAllNearbyView(),
      ),
      GoRoute(
        path: AppRoutes.developerUnitsPath,
        name: AppRoutes.developerUnits,
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
          return DeveloperUnitsView(developerId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.compoundUnitsPath,
        name: AppRoutes.compoundUnits,
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
          return CompoundUnitsView(compoundId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.propertyMapPath,
        name: AppRoutes.propertyMap,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return UnitMapView(
            latitude: extra['latitude'] as double,
            longitude: extra['longitude'] as double,
            title: extra['title'] as String,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.chooseProductPath,
        name: AppRoutes.chooseProduct,
        builder: (context, state) {
          final baseId =
              int.tryParse(state.pathParameters['baseId'] ?? '0') ?? 0;
          return ChooseProductView(baseUnitId: baseId);
        },
      ),
      GoRoute(
        path: AppRoutes.comparisonPath,
        name: AppRoutes.comparison,
        builder: (context, state) {
          final baseId =
              int.tryParse(state.pathParameters['baseId'] ?? '0') ?? 0;
          final selectedId =
              int.tryParse(state.pathParameters['selectedId'] ?? '0') ?? 0;
          return ComparisonView(baseUnitId: baseId, selectedUnitId: selectedId);
        },
      ),
    ],
    redirect: (context, state) {
      final authState = locator<AuthCubit>().state;
      return _handleRedirect(
        context,
        state,
        authState,
        locator<StorageService>(),
      );
    },
  );

  static String? _handleRedirect(
    BuildContext context,
    GoRouterState state,
    AuthState authState,
    StorageService storageService,
  ) {
    final authStatus = authState.authenticationStatus;
    final isOnboardingSeen = storageService.getIsOnboardingSeen();

    if (authStatus == AuthenticationStatus.unauthenticated) {
      return _handleUnauthenticatedRedirect(state, isOnboardingSeen);
    }

    if (authStatus == AuthenticationStatus.authenticated) {
      return _handleAuthenticatedRedirect(state, authState.user);
    }

    return null;
  }

  static String? _handleUnauthenticatedRedirect(
    GoRouterState state,
    bool isOnboardingSeen,
  ) {
    final location = state.uri.path;

    // 1. Onboarding Check
    if (!isOnboardingSeen) {
      // If not on public/verification/onboarding, go to Onboarding
      if (location != AppRoutes.onboardingPath &&
          location != AppRoutes.splashPath &&
          !location.contains('/api/email/verify') &&
          !location.contains('/api/password/verify')) {
        return AppRoutes.onboardingPath;
      }
      // If at Splash, go to Onboarding
      if (location == AppRoutes.splashPath) {
        return AppRoutes.onboardingPath;
      }
      return null;
    }

    // 2. Prevent returning to Onboarding if seen
    if (location == AppRoutes.onboardingPath) {
      return AppRoutes.loginPath;
    }

    // 3. Allow Public Pages
    if (_isPublicRoute(location)) {
      if (location == AppRoutes.splashPath) {
        return AppRoutes.loginPath;
      }
      return null;
    }

    // 4. Protected Route -> Redirect to Login with `redirect_to`
    // Encode the full URI (path + query) to preserve original intent
    final fullPath = state.uri.toString();
    final encodedPath = Uri.encodeComponent(fullPath);
    return '${AppRoutes.loginPath}?redirect_to=$encodedPath';
  }

  static String? _handleAuthenticatedRedirect(GoRouterState state, User? user) {
    final location = state.uri.path;

    // 1. Password Verification Loop Exception
    if (location.contains('/api/password/verify')) {
      return AppRoutes.layoutPath;
    }

    // 2. City Selection Check
    if (user != null) {
      final hasCity = user.cityId != null || (user.toJson()['city'] != null);
      if (!hasCity) {
        if (location == AppRoutes.citySelectPath) return null;
        return AppRoutes.citySelectPath;
      }

      // If at city select but have city, go out
      if (location == AppRoutes.citySelectPath && hasCity) {
        return AppRoutes.layoutPath;
      }
    }

    // 3. Auth Pages -> Redirect to Target or Layout
    if (_isAuthRoute(location)) {
      // Check for `redirect_to` query param
      final redirectTo = state.uri.queryParameters['redirect_to'];
      if (redirectTo != null && redirectTo.isNotEmpty) {
        return redirectTo;
      }
      return AppRoutes.layoutPath;
    }

    return null;
  }

  static bool _isPublicRoute(String location) =>
      location == AppRoutes.loginPath ||
      location == AppRoutes.registerPath ||
      location == AppRoutes.forgotPasswordPath ||
      location == AppRoutes.passwordSuccessPath ||
      location == AppRoutes.splashPath ||
      location == AppRoutes.termsPath ||
      location == AppRoutes.privacyPath ||
      location == AppRoutes.aboutUsPath ||
      location.contains('/api/email/verify') ||
      location.contains('/api/password/verify');

  static bool _isAuthRoute(String location) =>
      location == AppRoutes.loginPath ||
      location == AppRoutes.onboardingPath ||
      location == AppRoutes.registerPath ||
      location == AppRoutes.splashPath ||
      location.contains('/api/email/verify') ||
      location.contains('/api/password/verify');
}

/// Custom refresh stream that notifies on authentication and settings changes.
///
/// WHY: Original implementation notified on every state change, causing
/// unnecessary rebuilds.
///
/// FIX: Only notify when critical fields change (auth status, city presence, or locale).
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(
    List<Stream<dynamic>> streams, {
    required AuthenticationStatus initialAuthStatus,
    required bool initialHasCity,
    required String initialLocale,
  }) {
    _lastAuthStatus = initialAuthStatus;
    _lastHasCity = initialHasCity;
    _lastLocale = initialLocale;

    notifyListeners();

    for (final stream in streams) {
      final sub = stream.asBroadcastStream().listen((state) {
        var shouldNotify = false;

        if (state is AuthState) {
          final currentAuthStatus = state.authenticationStatus;
          final currentHasCity = state.user?.cityId != null;

          if (_lastAuthStatus != currentAuthStatus ||
              _lastHasCity != currentHasCity) {
            _lastAuthStatus = currentAuthStatus;
            _lastHasCity = currentHasCity;
            shouldNotify = true;
          }
        } else if (state is SettingsState) {
          final currentLocale = state.locale.languageCode;
          if (_lastLocale != currentLocale) {
            _lastLocale = currentLocale;
            shouldNotify = true;
          }
        }

        if (shouldNotify) notifyListeners();
      });
      _subscriptions.add(sub);
    }
  }

  AuthenticationStatus? _lastAuthStatus;
  bool? _lastHasCity;
  String? _lastLocale;
  final List<StreamSubscription<dynamic>> _subscriptions = [];

  @override
  void dispose() {
    for (final sub in _subscriptions) {
      sub.cancel();
    }
    super.dispose();
  }
}
