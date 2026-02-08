/// Auth-related constants for API, timeouts, and configuration.
///
/// WHY: Centralizes magic strings/numbers to avoid duplication and make
/// configuration changes easier. Also improves code readability.
library;

/// API and network configuration constants.
abstract final class AuthConstants {
  // ─────────────────────────────────────────────────────────────────────────
  // API Configuration
  // ─────────────────────────────────────────────────────────────────────────

  /// Base URL for all API requests.
  static const String apiBaseUrl = 'https://propix8.com/api/';

  // ─────────────────────────────────────────────────────────────────────────
  // Timeout Configuration
  // ─────────────────────────────────────────────────────────────────────────

  /// Connection timeout duration.
  /// WHY 15s: Balance between user patience and slow network conditions.
  static const Duration connectTimeout = Duration(seconds: 15);

  /// Receive timeout duration for response data.
  static const Duration receiveTimeout = Duration(seconds: 15);

  /// Auth check timeout on app startup.
  /// WHY 5s: Fast startup is critical for UX, cached data provides fallback.
  static const Duration authCheckTimeout = Duration(seconds: 5);

  // ─────────────────────────────────────────────────────────────────────────
  // Retry Configuration
  // ─────────────────────────────────────────────────────────────────────────

  /// Maximum number of retry attempts for failed requests.
  static const int maxRetries = 3;

  /// Initial delay before first retry (doubles each attempt).
  static const Duration initialRetryDelay = Duration(milliseconds: 500);

  /// Maximum delay between retries to prevent excessive waiting.
  static const Duration maxRetryDelay = Duration(seconds: 8);

  // ─────────────────────────────────────────────────────────────────────────
  // Debounce Configuration
  // ─────────────────────────────────────────────────────────────────────────

  /// Minimum time between login attempts to prevent rapid-fire requests.
  static const Duration loginDebounceDelay = Duration(seconds: 2);

  /// UI button debounce delay to prevent double-taps.
  static const Duration buttonDebounceDelay = Duration(seconds: 1);

  // ─────────────────────────────────────────────────────────────────────────
  // API Endpoints
  // ─────────────────────────────────────────────────────────────────────────

  static const String loginEndpoint = 'login';
  static const String registerEndpoint = 'register';
  static const String logoutEndpoint = 'logout';
  static const String forgotPasswordEndpoint = 'forgot-password';
  static const String resetPasswordEndpoint = 'reset-password';
  static const String resendVerificationEndpoint = 'email/resend';

  // ─────────────────────────────────────────────────────────────────────────
  // HTTP Status Codes
  // ─────────────────────────────────────────────────────────────────────────

  /// Unauthorized - token expired or invalid.
  static const int statusUnauthorized = 401;

  /// Too many requests - rate limited.
  static const int statusTooManyRequests = 429;

  /// Server errors that may warrant retry.
  static const List<int> retryableStatusCodes = [408, 500, 502, 503, 504];
}
