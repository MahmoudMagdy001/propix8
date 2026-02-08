/// Custom exception types for authentication flows.
///
/// WHY: Using specific exception types instead of generic "Error" catches
/// allows for:
/// 1. More granular error handling in UI (show specific messages)
/// 2. Better debugging (know exactly what failed)
/// 3. Proper error recovery strategies per exception type
library;

/// Base exception for all auth-related errors.
sealed class AuthException implements Exception {
  const AuthException(this.message, [this.originalError]);

  /// Human-readable error message (safe to show to users).
  final String message;

  /// Original error that caused this exception (for debugging).
  final Object? originalError;

  @override
  String toString() => 'AuthException: $message';
}

/// Token has expired or is invalid.
///
/// Recovery: Clear session and redirect to login.
final class TokenExpiredException extends AuthException {
  const TokenExpiredException([
    super.message = 'Session expired. Please log in again.',
  ]);
}

/// User credentials (email/password) are incorrect.
///
/// Recovery: Show error message, let user retry.
final class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException([
    super.message = 'Invalid email or password.',
  ]);
}

/// Email not verified yet.
///
/// Recovery: Show resend verification option.
final class EmailNotVerifiedException extends AuthException {
  const EmailNotVerifiedException([
    super.message = 'Please verify your email address.',
  ]);
}

/// Network-related error (no connection, timeout, server error).
///
/// Recovery: Show retry option, use cached data if available.
final class NetworkAuthException extends AuthException {
  const NetworkAuthException([
    super.message = 'Network error. Please check your connection.',
    super.originalError,
  ]);

  /// Whether this error is retryable (server error vs client error).
  bool get isRetryable => true;
}

/// Local storage operation failed.
///
/// Recovery: Continue with in-memory data, warn user about persistence.
final class StorageException extends AuthException {
  const StorageException([
    super.message = 'Failed to save data locally.',
    super.originalError,
  ]);
}

/// Rate limited by server.
///
/// Recovery: Show cooldown message, prevent further attempts.
final class RateLimitedException extends AuthException {
  const RateLimitedException({this.retryAfterSeconds})
    : super('Too many attempts. Please try again later.');

  /// Seconds until retry is allowed (from server header).
  final int? retryAfterSeconds;
}

/// User account is disabled or banned.
///
/// Recovery: Show contact support message.
final class AccountDisabledException extends AuthException {
  const AccountDisabledException([
    super.message = 'Your account has been disabled. Please contact support.',
  ]);
}

/// Login already in progress (debouncing).
///
/// Recovery: Ignore duplicate request silently.
final class DuplicateRequestException extends AuthException {
  const DuplicateRequestException([
    super.message = 'Request already in progress.',
  ]);
}
