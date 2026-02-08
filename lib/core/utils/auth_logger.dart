import 'package:flutter/foundation.dart';

/// Structured logging for authentication flows.
///
/// WHY: Provides consistent logging format for debugging auth issues without
/// accidentally exposing sensitive data like tokens or passwords in logs.
/// Uses debugPrint which is stripped in release builds for security.
abstract final class AuthLogger {
  /// Log level prefixes for filtering in console.
  static const String _debugPrefix = '[AUTH:DEBUG]';
  static const String _infoPrefix = '[AUTH:INFO]';
  static const String _errorPrefix = '[AUTH:ERROR]';

  /// Log debug-level auth events (only in debug mode).
  ///
  /// Use for detailed flow tracing that's not needed in production.
  static void debug(String message) {
    if (kDebugMode) {
      debugPrint('$_debugPrefix $message');
    }
  }

  /// Log info-level auth events.
  ///
  /// Use for significant auth state changes (login, logout, token refresh).
  static void info(String message) {
    debugPrint('$_infoPrefix $message');
  }

  /// Log error-level auth events.
  ///
  /// Use for auth failures, exceptions, and issues requiring attention.
  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    debugPrint('$_errorPrefix $message');
    if (error != null && kDebugMode) {
      debugPrint('$_errorPrefix Error: $error');
      if (stackTrace != null) {
        debugPrint('$_errorPrefix StackTrace: $stackTrace');
      }
    }
  }

  /// Log auth event with sanitized email (hides middle part).
  ///
  /// WHY: Useful for debugging user-specific issues without exposing
  /// full email addresses in logs.
  static void logAuthEvent(String event, {String? email}) {
    final sanitizedEmail = email != null ? _sanitizeEmail(email) : null;
    final message = sanitizedEmail != null
        ? '$event [user: $sanitizedEmail]'
        : event;
    info(message);
  }

  /// Log auth error with context but without sensitive data.
  static void logAuthError(
    String context, {
    String? email,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final sanitizedEmail = email != null ? _sanitizeEmail(email) : null;
    final message = sanitizedEmail != null
        ? '$context [user: $sanitizedEmail]'
        : context;
    AuthLogger.error(message, error, stackTrace);
  }

  /// Sanitize email by hiding middle portion.
  ///
  /// Example: "user@example.com" -> "us***@ex***.com"
  static String _sanitizeEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return '***';

    final local = parts[0];
    final domain = parts[1];
    final domainParts = domain.split('.');

    final sanitizedLocal = local.length > 2
        ? '${local.substring(0, 2)}***'
        : '***';

    final sanitizedDomain = domainParts.isNotEmpty && domainParts[0].length > 2
        ? '${domainParts[0].substring(0, 2)}***'
        : '***';

    final tld = domainParts.length > 1 ? '.${domainParts.last}' : '';

    return '$sanitizedLocal@$sanitizedDomain$tld';
  }
}
