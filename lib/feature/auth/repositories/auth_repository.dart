import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:propix8/core/public_feature/services/storage_service.dart';
import 'package:propix8/core/utils/auth_constants.dart';
import 'package:propix8/core/utils/auth_logger.dart';
import 'package:propix8/feature/auth/models/auth_model.dart';
import 'package:propix8/feature/auth/services/auth_service.dart';

/// Abstract repository defining auth operations contract.
///
/// WHY abstract: Enables testing with mock implementations and enforces
/// separation between interface and implementation details.
abstract class AuthRepository {
  Future<Either<String, AuthResponse>> login(LoginRequest request);
  Future<Either<String, AuthResponse>> register(RegisterRequest request);
  Future<Either<String, Map<String, String>>> forgotPassword(String email);
  Future<Either<String, String>> resetPassword(ResetPasswordRequest request);
  Future<Either<String, void>> resendVerificationEmail(String email);
  Future<Either<String, void>> verifyEmail(String url);
  Future<void> logout();
  Future<void> clearLocalSession();
  bool isLoggedIn();
  User? getCachedUser();

  /// Check if current token is expired (client-side check).
  /// Returns true if token is expired or doesn't exist.
  bool isTokenExpired();
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authService, this._storageService);

  final AuthService _authService;
  final StorageService _storageService;

  // ─────────────────────────────────────────────────────────────────────────
  // DEBOUNCING: Prevent duplicate API calls from rapid button taps
  // WHY: Users may double-tap login button, causing duplicate requests.
  // This wastes bandwidth and can cause race conditions.
  // ─────────────────────────────────────────────────────────────────────────

  bool _isLoginInProgress = false;
  DateTime? _lastLoginAttempt;

  @override
  Future<Either<String, AuthResponse>> login(LoginRequest request) async {
    // DEBOUNCING: Prevent concurrent login requests
    if (_isLoginInProgress) {
      AuthLogger.debug('Login already in progress, ignoring duplicate request');
      return const Left('Login already in progress');
    }

    // DEBOUNCING: Prevent rapid-fire attempts (minimum 2 second gap)
    final now = DateTime.now();
    if (_lastLoginAttempt != null &&
        now.difference(_lastLoginAttempt!) < AuthConstants.loginDebounceDelay) {
      AuthLogger.debug('Login attempt too soon, debouncing');
      return const Left('Please wait before retrying');
    }

    _isLoginInProgress = true;
    _lastLoginAttempt = now;

    try {
      AuthLogger.logAuthEvent('Login attempt', email: request.email);
      final response = await _authService.login(request);

      // Safe token save with null check (no ! operator)
      final token = response.token;
      if (token != null && token.isNotEmpty) {
        await _storageService.saveToken(token);

        // Cache user data if available
        final user = response.user;
        if (user != null) {
          await _storageService.saveUser(user.toJson());
        }
      }

      AuthLogger.logAuthEvent('Login successful', email: request.email);
      return Right(response);
    } on DioException catch (e) {
      AuthLogger.logAuthError('Login failed', email: request.email, error: e);
      return Left(_handleError(e, 'Login failed'));
    } catch (e) {
      AuthLogger.logAuthError(
        'Login unexpected error',
        email: request.email,
        error: e,
      );
      return Left(e.toString());
    } finally {
      _isLoginInProgress = false;
    }
  }

  @override
  Future<Either<String, AuthResponse>> register(RegisterRequest request) async {
    try {
      AuthLogger.logAuthEvent('Registration attempt', email: request.email);
      final response = await _authService.register(request);
      // Do not save token/user here. We want to force manual login.
      AuthLogger.logAuthEvent('Registration successful', email: request.email);
      return Right(response);
    } on DioException catch (e) {
      AuthLogger.logAuthError(
        'Registration failed',
        email: request.email,
        error: e,
      );
      return Left(_handleError(e, 'Registration failed'));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Map<String, String>>> forgotPassword(
    String email,
  ) async {
    try {
      AuthLogger.logAuthEvent('Forgot password request', email: email);
      final data = await _authService.forgotPassword(email);
      return Right(data);
    } on DioException catch (e) {
      AuthLogger.logAuthError('Forgot password failed', email: email, error: e);
      return Left(_handleError(e, 'Action failed'));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      AuthLogger.logAuthEvent('Password reset attempt', email: request.email);
      final message = await _authService.resetPassword(request);
      AuthLogger.logAuthEvent(
        'Password reset successful',
        email: request.email,
      );
      return Right(message);
    } on DioException catch (e) {
      AuthLogger.logAuthError(
        'Password reset failed',
        email: request.email,
        error: e,
      );
      return Left(_handleError(e, 'Reset failed'));
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Map DioException to user-friendly error message.
  ///
  /// WHY: Raw Dio errors are technical and confusing to users.
  /// This extracts server messages or provides sensible defaults.
  String _handleError(DioException e, String defaultMessage) {
    // Check for response data with error message
    final responseData = e.response?.data;
    if (responseData != null && responseData is Map) {
      final data = responseData as Map<String, dynamic>;

      // 1. Try top-level message
      final message = data['message'];
      if (message != null) return message.toString();

      // 2. Try nested errors object (Laravel validation format)
      final errors = data['errors'];
      if (errors != null && errors is Map) {
        final errorsMap = errors as Map<String, dynamic>;
        if (errorsMap.isNotEmpty) {
          final firstError = errorsMap.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            return firstError.first.toString();
          }
          if (firstError is String) return firstError;
        }
      }
    }

    // Network-specific error messages
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return 'Connection timed out. Please check your internet.';
      case DioExceptionType.connectionError:
        return 'Network error. Please check your connection.';
      default:
        return e.message ?? defaultMessage;
    }
  }

  @override
  Future<void> logout() async {
    AuthLogger.info('User logout initiated');
    try {
      await _authService.logout();
    } finally {
      // SECURITY: Clear auth data even if API call fails
      // Use clearAuthData which handles both memory and disk cleanup
      await _storageService.clearAuthData();
      AuthLogger.info('User logged out, session cleared');
    }
  }

  @override
  Future<void> clearLocalSession() async {
    await _storageService.clearAuthData();
    AuthLogger.info('Local session cleared without server call');
  }

  @override
  Future<Either<String, void>> resendVerificationEmail(String email) async {
    try {
      AuthLogger.logAuthEvent('Resend verification email', email: email);
      await _authService.resendVerificationEmail(email);
      return const Right(null);
    } on DioException catch (e) {
      AuthLogger.logAuthError(
        'Resend verification failed',
        email: email,
        error: e,
      );
      return Left(_handleError(e, 'Failed to resend verification email'));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> verifyEmail(String url) async {
    try {
      AuthLogger.logAuthEvent('Email verification attempt');
      await _authService.verifyEmailByUrl(url);
      AuthLogger.info('Email verified successfully');
      return const Right(null);
    } on DioException catch (e) {
      AuthLogger.logAuthError('Email verification failed', error: e);
      return Left(_handleError(e, 'Verification failed'));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  bool isLoggedIn() {
    final token = _storageService.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  User? getCachedUser() {
    final userJson = _storageService.getUser();
    if (userJson == null) return null;
    try {
      return User.fromJson(userJson);
    } catch (e) {
      AuthLogger.error('Failed to parse cached user', e);
      return null;
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // JWT EXPIRY CHECK
  // WHY: Check token expiry client-side before making API calls.
  // This saves bandwidth and provides faster feedback to user.
  // ─────────────────────────────────────────────────────────────────────────

  @override
  bool isTokenExpired() {
    final token = _storageService.getToken();
    if (token == null || token.isEmpty) return true;

    try {
      // JWT format: header.payload.signature
      final parts = token.split('.');
      if (parts.length != 3) {
        // Not a valid JWT format, let server handle it
        return false;
      }

      // Decode payload (middle part)
      // WHY base64Url.normalize: JWT uses URL-safe base64 which may omit padding
      final normalizedPayload = base64Url.normalize(parts[1]);
      final payloadBytes = base64Url.decode(normalizedPayload);
      final payloadString = utf8.decode(payloadBytes);
      final payload = jsonDecode(payloadString) as Map<String, dynamic>;

      // Check expiry claim (exp is Unix timestamp in seconds)
      final exp = payload['exp'];
      if (exp == null || exp is! num) {
        // No expiry claim, let server handle it
        return false;
      }

      // Compare with current time (exp is in seconds, Dart uses milliseconds)
      final expiryTime = DateTime.fromMillisecondsSinceEpoch(
        exp.toInt() * 1000,
      );
      final isExpired = DateTime.now().isAfter(expiryTime);

      if (isExpired) {
        AuthLogger.debug('Token expired at $expiryTime');
      }

      return isExpired;
    } catch (e) {
      // If decode fails for any reason, let server validate the token
      AuthLogger.debug('Could not decode token for expiry check: $e');
      return false;
    }
  }
}
