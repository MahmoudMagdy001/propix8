import 'dart:async';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/core/utils/auth_logger.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/auth/domain/repositories/address_setup_repository.dart';
import 'package:propix8/feature/auth/domain/repositories/auth_repository.dart';
import 'package:propix8/feature/auth/domain/usecases/get_auth_profile_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/login_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/logout_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/register_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/resend_verification_email_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/verify_email_usecase.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_event.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends SafeBloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepository,
    required AddressSetupRepository addressSetupRepository,
    LoginUseCase? loginUseCase,
    RegisterUseCase? registerUseCase,
    LogoutUseCase? logoutUseCase,
    ResendVerificationEmailUseCase? resendVerificationEmailUseCase,
    VerifyEmailUseCase? verifyEmailUseCase,
    GetAuthProfileUseCase? getAuthProfileUseCase,
  })  : _authRepository = authRepository,
        _loginUseCase = loginUseCase ?? LoginUseCase(authRepository),
        _registerUseCase = registerUseCase ?? RegisterUseCase(authRepository),
        _logoutUseCase = logoutUseCase ?? LogoutUseCase(authRepository),
        _resendVerificationEmailUseCase =
            resendVerificationEmailUseCase ??
            ResendVerificationEmailUseCase(authRepository),
        _verifyEmailUseCase =
            verifyEmailUseCase ?? VerifyEmailUseCase(authRepository),
        _getAuthProfileUseCase =
            getAuthProfileUseCase ??
            GetAuthProfileUseCase(addressSetupRepository),
        super(const AuthState()) {
    on<CheckAuthStatusRequested>(_onCheckAuthStatus);
    on<LoginRequested>(_onLogin);
    on<RegisterRequested>(_onRegister);
    on<LogoutRequested>(_onLogout);
    on<ClearLocalSessionRequested>(_onClearLocalSession);
    on<ResendVerificationEmailRequested>(_onResendVerificationEmail);
    on<VerifyEmailRequested>(_onVerifyEmail);
    on<AuthUserUpdated>(_onAuthUserUpdated);
    on<CheckUserProfileRequested>(_onCheckUserProfile);
  }

  final AuthRepository _authRepository;
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;
  final ResendVerificationEmailUseCase _resendVerificationEmailUseCase;
  final VerifyEmailUseCase _verifyEmailUseCase;
  final GetAuthProfileUseCase _getAuthProfileUseCase;

  bool _isCheckingAuth = false;

  Future<void> _onCheckAuthStatus(
    CheckAuthStatusRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (_isCheckingAuth) {
      AuthLogger.debug('checkAuthStatus already in progress, skipping');
      return;
    }
    _isCheckingAuth = true;

    try {
      final isLoggedIn = _authRepository.isLoggedIn();

      if (!isLoggedIn) {
        emit(
          state.copyWith(
            authenticationStatus: AuthenticationStatus.unauthenticated,
          ),
        );
        return;
      }

      if (_authRepository.isTokenExpired()) {
        AuthLogger.info('Token expired, logging out');
        await _logoutUseCase();
        emit(
          const AuthState(
            authenticationStatus: AuthenticationStatus.unauthenticated,
          ),
        );
        return;
      }

      final cachedUser = _authRepository.getCachedUser();
      if (cachedUser != null && cachedUser.cityId != null) {
        AuthLogger.debug('Using cached user for fast startup');
        emit(
          state.copyWith(
            status: AuthRequestStatus.success,
            authenticationStatus: AuthenticationStatus.authenticated,
            user: cachedUser,
          ),
        );
        _refreshProfileInBackground();
      } else {
        await _fetchUserProfile(emit: emit);
      }
    } finally {
      _isCheckingAuth = false;
    }
  }

  void _refreshProfileInBackground() {
    unawaited(
      checkUserProfile(isBackgroundSync: true).catchError((Object error) {
        AuthLogger.debug('Background profile refresh failed: $error');
      }),
    );
  }

  Future<void> _fetchUserProfile({
    required Emitter<AuthState> emit,
    bool isBackgroundSync = false,
  }) async {
    if (state.authenticationStatus != AuthenticationStatus.authenticated &&
        !isBackgroundSync) {
      emit(state.copyWith(status: AuthRequestStatus.loading));
    }

    final result = await _getAuthProfileUseCase();
    result.fold(
      (failure) {
        AuthLogger.logAuthError('Profile fetch failed', error: failure.message);
        if (isBackgroundSync) {
          AuthLogger.info(
            'Background profile sync failed, keeping cached session. Error: ${failure.message}',
          );
          return;
        }

        emit(
          state.copyWith(
            status: AuthRequestStatus.failure,
            authenticationStatus: AuthenticationStatus.unauthenticated,
            errorMessage: failure.message,
          ),
        );
      },
      (user) {
        AuthLogger.debug('Profile fetched successfully');
        emit(
          state.copyWith(
            status: AuthRequestStatus.success,
            authenticationStatus: AuthenticationStatus.authenticated,
            user: user,
          ),
        );
      },
    );
  }

  Future<void> _onCheckUserProfile(
    CheckUserProfileRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _fetchUserProfile(
      emit: emit,
      isBackgroundSync: event.isBackgroundSync,
    );
  }

  Future<void> _onLogin(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthRequestStatus.loading));

    final result = await _loginUseCase(
      LoginRequest(email: event.email, password: event.password),
    );

    await result.fold(
      (failure) async {
        emit(
          state.copyWith(
            status: AuthRequestStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (response) async {
        await _fetchUserProfile(emit: emit);
      },
    );
  }

  Future<void> _onRegister(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthRequestStatus.loading));

    final result = await _registerUseCase(event.request);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthRequestStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) {
        emit(
          state.copyWith(
            status: AuthRequestStatus.success,
            authenticationStatus: AuthenticationStatus.unauthenticated,
            user: response.user,
          ),
        );
      },
    );
  }

  Future<void> _onLogout(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    AuthLogger.info('Logout initiated');
    await _logoutUseCase();
    emit(
      const AuthState(
        authenticationStatus: AuthenticationStatus.unauthenticated,
      ),
    );
  }

  Future<void> _onClearLocalSession(
    ClearLocalSessionRequested event,
    Emitter<AuthState> emit,
  ) async {
    AuthLogger.info('Clearing local session only');
    await _authRepository.clearLocalSession();
    emit(
      const AuthState(
        authenticationStatus: AuthenticationStatus.unauthenticated,
      ),
    );
  }

  Future<void> _onResendVerificationEmail(
    ResendVerificationEmailRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(resendStatus: AuthRequestStatus.loading));
    final result = await _resendVerificationEmailUseCase(event.email);
    result.fold(
      (failure) => emit(
        state.copyWith(
          resendStatus: AuthRequestStatus.failure,
          resendMessage: failure.message,
        ),
      ),
      (_) => emit(state.copyWith(resendStatus: AuthRequestStatus.success)),
    );
  }

  Future<void> _onVerifyEmail(
    VerifyEmailRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(verificationStatus: AuthRequestStatus.loading));
    final result = await _verifyEmailUseCase(event.url);
    result.fold(
      (failure) => emit(
        state.copyWith(
          verificationStatus: AuthRequestStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (_) => emit(
        state.copyWith(verificationStatus: AuthRequestStatus.success),
      ),
    );
  }

  void _onAuthUserUpdated(
    AuthUserUpdated event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(user: event.user));
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Convenience Async API
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> checkAuthStatus() async {
    final completer = Completer<void>();
    add(const CheckAuthStatusRequested());
    await stream.firstWhere(
      (s) => s.authenticationStatus != AuthenticationStatus.unknown,
      orElse: () => state,
    );
    if (!completer.isCompleted) completer.complete();
    return completer.future;
  }

  Future<void> login(String email, String password) async {
    add(LoginRequested(email: email, password: password));
  }

  Future<void> register(RegisterRequest request) async {
    add(RegisterRequested(request));
  }

  Future<void> logout() async {
    add(const LogoutRequested());
  }

  Future<void> clearLocalSession() async {
    add(const ClearLocalSessionRequested());
  }

  Future<void> resendVerificationEmail(String email) async {
    add(ResendVerificationEmailRequested(email));
  }

  Future<void> verifyEmail(String url) async {
    add(VerifyEmailRequested(url));
  }

  Future<void> updateUser(User user) async {
    add(AuthUserUpdated(user));
  }

  Future<void> checkUserProfile({bool isBackgroundSync = false}) async {
    add(CheckUserProfileRequested(isBackgroundSync: isBackgroundSync));
  }
}
