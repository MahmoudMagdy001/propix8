import 'package:dio/dio.dart';
import 'package:propix8/core/public_feature/services/storage_service.dart';
import 'package:propix8/core/router/app_router.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/auth_constants.dart';
import 'package:propix8/core/utils/auth_logger.dart';

/// Interceptor that handles authentication headers and token expiry.
///
/// RESPONSIBILITIES:
/// 1. Attach auth token to every request (Authorization header)
/// 2. Add Accept and Accept-Language headers
/// 3. Handle 401 Unauthorized by clearing session and redirecting to login
///
/// SECURITY: On 401, clears both disk and in-memory token data before redirect.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._storageService);
  final StorageService _storageService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add Accept header for JSON responses
    options.headers['Accept'] = 'application/json';

    // Add Language header for localized responses
    final locale = _storageService.getLocale();
    options.headers['Accept-Language'] = locale;

    // Add Token header if exists
    // OPTIMIZATION: getToken() now reads from in-memory cache first
    final token = _storageService.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      // Log request without exposing token
      AuthLogger.debug('Request with auth: ${options.path}');
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;

    // Handle 401 Unauthorized - token expired or invalid
    if (statusCode == AuthConstants.statusUnauthorized) {
      AuthLogger.info('401 Unauthorized received, clearing session');

      // SECURITY: Clear token from both disk and memory
      // Using synchronous memory clear + async disk clear
      _storageService
        ..clearMemory()
        ..deleteToken(); // Fire-and-forget, no await needed

      // Redirect to login
      AppRouter.router.goNamed(AppRoutes.login);
    }

    // Handle 429 Too Many Requests (rate limited)
    if (statusCode == AuthConstants.statusTooManyRequests) {
      AuthLogger.error('Rate limited on: ${err.requestOptions.path}');
      // Could extract Retry-After header here if needed
    }

    return handler.next(err);
  }
}
