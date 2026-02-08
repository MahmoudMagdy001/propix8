import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/auth_logger.dart';
import '../models/auth_model.dart';
import '../repo/auth_repository.dart';
import '../views/map/repositories/address_setup_repository.dart';
import 'auth_state.dart';

/// Cubit managing authentication state.
///
/// OPTIMIZATIONS vs original:
/// 1. Race condition prevention for checkAuthStatus()
/// 2. Safe emit pattern (checks isClosed before emitting)
/// 3. Structured logging for debugging
/// 4. Token expiry check before profile fetch
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository, this._addressSetupRepository)
    : super(const AuthState());

  final AuthRepository _authRepository;
  final AddressSetupRepository _addressSetupRepository;

  // ─────────────────────────────────────────────────────────────────────────
  // RACE CONDITION PREVENTION
  // WHY: checkAuthStatus() can be called multiple times rapidly during app
  // startup or navigation. Without guard, this causes race conditions where
  // multiple profile fetches happen concurrently.
  // ─────────────────────────────────────────────────────────────────────────

  bool _isCheckingAuth = false;

  Future<void> checkAuthStatus() async {
    // Prevent concurrent calls (race condition fix)
    if (_isCheckingAuth) {
      AuthLogger.debug('checkAuthStatus already in progress, skipping');
      return;
    }
    _isCheckingAuth = true;

    try {
      // Check if token exists (fast, from memory cache)
      final isLoggedIn = _authRepository.isLoggedIn();

      if (!isLoggedIn) {
        _safeEmit(
          state.copyWith(
            authenticationStatus: AuthenticationStatus.unauthenticated,
          ),
        );
        return;
      }

      // OPTIMIZATION: Check token expiry client-side before making API call
      if (_authRepository.isTokenExpired()) {
        AuthLogger.info('Token expired, logging out');
        await logout();
        return;
      }

      // Try to use cached user first for fast startup
      final cachedUser = _authRepository.getCachedUser();
      if (cachedUser != null && cachedUser.cityId != null) {
        AuthLogger.debug('Using cached user for fast startup');
        _safeEmit(
          state.copyWith(
            status: AuthRequestStatus.success,
            authenticationStatus: AuthenticationStatus.authenticated,
            user: cachedUser,
          ),
        );
        // Background refresh to sync with server (non-blocking)
        _refreshProfileInBackground();
      } else {
        // No cached user or city not set, fetch from server
        await checkUserProfile();
      }
    } finally {
      _isCheckingAuth = false;
    }
  }

  /// Silently refresh user profile from server in background.
  ///
  /// WHY: After showing cached data for fast startup, we sync with server
  /// to ensure data is fresh. Errors are swallowed since UI already has data.
  void _refreshProfileInBackground() {
    checkUserProfile(isBackgroundSync: true).catchError((error) {
      AuthLogger.debug('Background profile refresh failed: $error');
      // Swallow error - UI already has cached data
    });
  }

  Future<void> login(String email, String password) async {
    _safeEmit(state.copyWith(status: AuthRequestStatus.loading));

    final result = await _authRepository.login(
      LoginRequest(email: email, password: password),
    );

    result.fold(
      (error) => _safeEmit(
        state.copyWith(status: AuthRequestStatus.failure, errorMessage: error),
      ),
      (response) async {
        // After success login, fetch full profile to check city_id
        await checkUserProfile();
      },
    );
  }

  Future<void> checkUserProfile({bool isBackgroundSync = false}) async {
    // Only set loading if we are not already authenticated (to avoid UI flash)
    if (state.authenticationStatus != AuthenticationStatus.authenticated &&
        !isBackgroundSync) {
      _safeEmit(state.copyWith(status: AuthRequestStatus.loading));
    }

    final result = await _addressSetupRepository.getProfile();
    result.fold(
      (error) {
        AuthLogger.logAuthError('Profile fetch failed', error: error);

        // OPTIMIZATION: If this is a background sync (e.g. app startup with cache),
        // failure to fetch fresh profile should NOT log the user out.
        // We just keep using the cached data.
        if (isBackgroundSync) {
          AuthLogger.info(
            'Background profile sync failed, keeping cached session. Error: $error',
          );
          return;
        }

        // If profile fetch fails during explicit login/check and we have no fallback,
        // then we treat as failure.
        _safeEmit(
          state.copyWith(
            status: AuthRequestStatus.failure,
            authenticationStatus: AuthenticationStatus.unauthenticated,
            errorMessage: error,
          ),
        );
      },
      (user) {
        AuthLogger.debug('Profile fetched successfully');
        _safeEmit(
          state.copyWith(
            status: AuthRequestStatus.success,
            authenticationStatus: AuthenticationStatus.authenticated,
            user: user,
          ),
        );
      },
    );
  }

  Future<void> register(RegisterRequest request) async {
    _safeEmit(state.copyWith(status: AuthRequestStatus.loading));

    final result = await _authRepository.register(request);

    result.fold(
      (error) => _safeEmit(
        state.copyWith(status: AuthRequestStatus.failure, errorMessage: error),
      ),
      (response) {
        // Registration success.
        // User requested to redirect to login after signup, avoiding auto-login.
        _safeEmit(
          state.copyWith(
            status: AuthRequestStatus.success,
            authenticationStatus: AuthenticationStatus.unauthenticated,
            user: response.user,
          ),
        );
      },
    );
  }

  Future<void> logout() async {
    AuthLogger.info('Logout initiated');
    await _authRepository.logout();
    _safeEmit(
      const AuthState(
        authenticationStatus: AuthenticationStatus.unauthenticated,
      ),
    );
  }

  Future<void> resendVerificationEmail(String email) async {
    _safeEmit(state.copyWith(resendStatus: AuthRequestStatus.loading));
    final result = await _authRepository.resendVerificationEmail(email);
    result.fold(
      (error) => _safeEmit(
        state.copyWith(
          resendStatus: AuthRequestStatus.failure,
          resendMessage: error,
        ),
      ),
      (_) => _safeEmit(state.copyWith(resendStatus: AuthRequestStatus.success)),
    );
  }

  Future<void> verifyEmail(String url) async {
    _safeEmit(state.copyWith(verificationStatus: AuthRequestStatus.loading));
    final result = await _authRepository.verifyEmail(url);
    result.fold(
      (error) => _safeEmit(
        state.copyWith(
          verificationStatus: AuthRequestStatus.failure,
          errorMessage: error,
        ),
      ),
      (_) => _safeEmit(
        state.copyWith(verificationStatus: AuthRequestStatus.success),
      ),
    );
  }

  Future<void> updateUser(User user) async {
    _safeEmit(state.copyWith(user: user));
  }

  // ─────────────────────────────────────────────────────────────────────────
  // MEMORY SAFETY
  // WHY: Emit after cubit is closed causes errors. This can happen when
  // async operations complete after navigation or widget disposal.
  // ─────────────────────────────────────────────────────────────────────────

  /// Safe emit that checks if cubit is still active.
  ///
  /// MEMORY SAFETY: Prevents "emit after dispose" errors when async
  /// operations complete after widget is unmounted.
  void _safeEmit(AuthState newState) {
    if (!isClosed) {
      emit(newState);
    } else {
      AuthLogger.debug('Attempted emit after cubit closed, ignoring');
    }
  }
}
