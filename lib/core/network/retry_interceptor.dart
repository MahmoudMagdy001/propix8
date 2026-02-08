import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';

import '../utils/auth_constants.dart';
import '../utils/auth_logger.dart';

/// Retry interceptor with exponential backoff for failed requests.
///
/// WHY: Network requests can fail due to transient issues (server overload,
/// temporary network problems). Automatic retry with exponential backoff
/// improves reliability without overwhelming the server.
///
/// BEHAVIOR:
/// - Retries only GET requests by default (safe to retry)
/// - Retries server errors (5xx) and specific client errors (408 timeout)
/// - Uses exponential backoff: 500ms → 1s → 2s → ... up to 8s max
/// - Maximum 3 retries before giving up
class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    this.maxRetries = AuthConstants.maxRetries,
    this.initialDelay = AuthConstants.initialRetryDelay,
    this.maxDelay = AuthConstants.maxRetryDelay,
  });

  final int maxRetries;
  final Duration initialDelay;
  final Duration maxDelay;

  /// Counter for tracking retries per request (using request hashCode as key).
  final Map<int, int> _retryCount = {};

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final requestId = err.requestOptions.hashCode;

    // Only retry if the error is retryable
    if (!_shouldRetry(err)) {
      _retryCount.remove(requestId);
      return handler.next(err);
    }

    // Check retry count
    final currentRetry = _retryCount[requestId] ?? 0;
    if (currentRetry >= maxRetries) {
      AuthLogger.error(
        'Max retries ($maxRetries) reached for ${err.requestOptions.path}',
      );
      _retryCount.remove(requestId);
      return handler.next(err);
    }

    // Calculate delay with exponential backoff and jitter
    final delay = _calculateDelay(currentRetry);
    _retryCount[requestId] = currentRetry + 1;

    AuthLogger.info(
      'Retrying request (${currentRetry + 1}/$maxRetries) '
      'to ${err.requestOptions.path} after ${delay.inMilliseconds}ms',
    );

    // Wait before retry
    await Future.delayed(delay);

    // Retry the request
    try {
      // Create a new Dio instance with proper base configuration
      final dio = Dio()..options.baseUrl = err.requestOptions.baseUrl;
      final response = await dio.fetch(err.requestOptions);
      _retryCount.remove(requestId);
      return handler.resolve(response);
    } on DioException catch (retryError) {
      // Recursively handle the retry error
      return onError(retryError, handler);
    }
  }

  /// Determine if the error warrants a retry.
  bool _shouldRetry(DioException err) {
    // Only retry GET requests by default (idempotent).
    // POST/PUT requests could cause duplicate data if retried.
    if (err.requestOptions.method.toUpperCase() != 'GET') {
      return false;
    }

    // Retry on connection/timeout errors
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.connectionError) {
      return true;
    }

    // Retry on specific status codes
    final statusCode = err.response?.statusCode;
    if (statusCode != null &&
        AuthConstants.retryableStatusCodes.contains(statusCode)) {
      return true;
    }

    return false;
  }

  /// Calculate delay with exponential backoff and jitter.
  ///
  /// WHY jitter: Prevents "thundering herd" problem where many clients
  /// retry at exactly the same time after a server outage.
  Duration _calculateDelay(int retryCount) {
    // Exponential: 500ms * 2^retryCount = 500ms, 1s, 2s, 4s, 8s...
    final exponentialDelay = initialDelay * pow(2, retryCount);

    // Cap at maxDelay
    final cappedDelay = exponentialDelay > maxDelay
        ? maxDelay
        : exponentialDelay;

    // Add random jitter (±25%)
    final jitterFactor = 0.75 + (Random().nextDouble() * 0.5);
    final finalMs = (cappedDelay.inMilliseconds * jitterFactor).round();

    return Duration(milliseconds: finalMs);
  }
}
