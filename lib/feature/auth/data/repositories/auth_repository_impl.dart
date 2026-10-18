import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/functional/result.dart';
import 'package:propix8/core/storage/storage_service.dart';
import 'package:propix8/core/utils/auth_constants.dart';
import 'package:propix8/core/utils/auth_logger.dart';
import 'package:propix8/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource, this._storageService);

  final AuthRemoteDataSource _remoteDataSource;
  final StorageService _storageService;

  bool _isLoginInProgress = false;
  DateTime? _lastLoginAttempt;

  @override
  ResultFuture<AuthResponse> login(LoginRequest request) async {
    if (_isLoginInProgress) {
      AuthLogger.debug('Login already in progress, ignoring duplicate request');
      return const Left(AuthFailure('Login already in progress'));
    }

    final now = DateTime.now();
    if (_lastLoginAttempt != null &&
        now.difference(_lastLoginAttempt!) < AuthConstants.loginDebounceDelay) {
      AuthLogger.debug('Login attempt too soon, debouncing');
      return const Left(AuthFailure('Please wait before retrying'));
    }

    _isLoginInProgress = true;
    _lastLoginAttempt = now;

    try {
      AuthLogger.logAuthEvent('Login attempt', email: request.email);
      final response = await _remoteDataSource.login(request);

      final token = response.token;
      if (token != null && token.isNotEmpty) {
        await _storageService.saveToken(token);

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
    } on Object catch (e) {
      AuthLogger.logAuthError(
        'Login unexpected error',
        email: request.email,
        error: e,
      );
      return Left(UnknownFailure(e.toString()));
    } finally {
      _isLoginInProgress = false;
    }
  }

  @override
  ResultFuture<AuthResponse> register(RegisterRequest request) async {
    try {
      AuthLogger.logAuthEvent('Registration attempt', email: request.email);
      final response = await _remoteDataSource.register(request);
      AuthLogger.logAuthEvent('Registration successful', email: request.email);
      return Right(response);
    } on DioException catch (e) {
      AuthLogger.logAuthError(
        'Registration failed',
        email: request.email,
        error: e,
      );
      return Left(_handleError(e, 'Registration failed'));
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultFuture<Map<String, String>> forgotPassword(String email) async {
    try {
      AuthLogger.logAuthEvent('Forgot password request', email: email);
      final data = await _remoteDataSource.forgotPassword(email);
      return Right(data);
    } on DioException catch (e) {
      AuthLogger.logAuthError('Forgot password failed', email: email, error: e);
      return Left(_handleError(e, 'Action failed'));
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultFuture<String> resetPassword(ResetPasswordRequest request) async {
    try {
      AuthLogger.logAuthEvent('Password reset attempt', email: request.email);
      final message = await _remoteDataSource.resetPassword(request);
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
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  Failure _handleError(DioException e, String defaultMessage) {
    final statusCode = e.response?.statusCode;
    final responseData = e.response?.data;
    String? message;

    if (responseData != null && responseData is Map) {
      final data = responseData as Map<String, dynamic>;

      final rawMessage = data['message'];
      if (rawMessage != null) {
        message = rawMessage.toString();
      } else {
        final errors = data['errors'];
        if (errors != null && errors is Map) {
          final errorsMap = errors as Map<String, dynamic>;
          if (errorsMap.isNotEmpty) {
            final firstError = errorsMap.values.first;
            if (firstError is List && firstError.isNotEmpty) {
              message = firstError.first.toString();
            } else if (firstError is String) {
              message = firstError;
            }
          }
        }
      }
    }

    if (message == null) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return const NetworkFailure(
            'Connection timed out. Please check your internet.',
          );
        case DioExceptionType.connectionError:
          return const NetworkFailure();
        default:
          message = e.message ?? defaultMessage;
      }
    }

    if (statusCode == 401 || statusCode == 403) {
      return AuthFailure(message, statusCode);
    } else if (statusCode == 422) {
      return ValidationFailure(message);
    }
    return ServerFailure(message, statusCode);
  }

  @override
  Future<void> logout() async {
    AuthLogger.info('User logout initiated');
    try {
      await _remoteDataSource.logout();
    } finally {
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
  ResultUnit resendVerificationEmail(String email) async {
    try {
      AuthLogger.logAuthEvent('Resend verification email', email: email);
      await _remoteDataSource.resendVerificationEmail(email);
      return const Right(unit);
    } on DioException catch (e) {
      AuthLogger.logAuthError(
        'Resend verification failed',
        email: email,
        error: e,
      );
      return Left(_handleError(e, 'Failed to resend verification email'));
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultUnit verifyEmail(String url) async {
    try {
      AuthLogger.logAuthEvent('Email verification attempt');
      await _remoteDataSource.verifyEmailByUrl(url);
      AuthLogger.info('Email verified successfully');
      return const Right(unit);
    } on DioException catch (e) {
      AuthLogger.logAuthError('Email verification failed', error: e);
      return Left(_handleError(e, 'Verification failed'));
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
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
    } on Object catch (e) {
      AuthLogger.error('Failed to parse cached user', e);
      return null;
    }
  }

  @override
  bool isTokenExpired() {
    final token = _storageService.getToken();
    if (token == null || token.isEmpty) return true;

    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        return false;
      }

      final normalizedPayload = base64Url.normalize(parts[1]);
      final payloadBytes = base64Url.decode(normalizedPayload);
      final payloadString = utf8.decode(payloadBytes);
      final payload = jsonDecode(payloadString) as Map<String, dynamic>;

      final exp = payload['exp'];
      if (exp == null || exp is! num) {
        return false;
      }

      final expiryTime = DateTime.fromMillisecondsSinceEpoch(
        exp.toInt() * 1000,
      );
      final isExpired = DateTime.now().isAfter(expiryTime);

      if (isExpired) {
        AuthLogger.debug('Token expired at $expiryTime');
      }

      return isExpired;
    } on Object catch (e) {
      AuthLogger.debug('Could not decode token for expiry check: $e');
      return false;
    }
  }
}
