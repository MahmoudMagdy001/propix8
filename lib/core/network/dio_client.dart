import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:propix8/core/network/auth_interceptor.dart';
import 'package:propix8/core/network/retry_interceptor.dart';
import 'package:propix8/core/utils/auth_constants.dart';

/// HTTP client wrapper providing standardized Dio configuration.
///
/// OPTIMIZATIONS vs original:
/// 1. Uses constants instead of magic numbers for configuration
/// 2. Added RetryInterceptor for automatic retry with exponential backoff
/// 3. Typed data parameters (Object? instead of dynamic) for null-safety
///
/// INTERCEPTOR ORDER matters:
/// 1. AuthInterceptor - adds auth headers to every request
/// 2. RetryInterceptor - handles retries for failed GET requests
/// 3. PrettyDioLogger - logs requests/responses (last to see final state)
class DioClient {
  DioClient(this._dio, this._authInterceptor) {
    _dio
      ..options.baseUrl = AuthConstants.apiBaseUrl
      ..options.connectTimeout = AuthConstants.connectTimeout
      ..options.receiveTimeout = AuthConstants.receiveTimeout
      ..options.responseType = ResponseType.json
      // INTERCEPTOR ORDER: Auth → Retry → Logger
      ..interceptors.add(_authInterceptor)
      ..interceptors.add(RetryInterceptor());
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(requestHeader: true, requestBody: true),
      );
    }
  }

  final Dio _dio;
  final AuthInterceptor _authInterceptor;

  /// Perform HTTP GET request.
  ///
  /// [url] - Endpoint path (appended to baseUrl).
  /// [queryParameters] - URL query parameters.
  /// [options] - Additional Dio request options.
  /// [cancelToken] - Token to cancel the request.
  /// [onReceiveProgress] - Callback for download progress.
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken ?? (Zone.current[#blocCancelKey] as CancelToken?),
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Perform HTTP POST request.
  ///
  /// [url] - Endpoint path (appended to baseUrl).
  /// [data] - Request body (typed as Object? for null-safety, was dynamic).
  /// [queryParameters] - URL query parameters.
  /// [options] - Additional Dio request options.
  /// [cancelToken] - Token to cancel the request.
  /// [onSendProgress] - Callback for upload progress.
  /// [onReceiveProgress] - Callback for download progress.
  Future<Response<dynamic>> post(
    String url, {
    Object? data, // FIXED: Was 'data,' (dynamic) - now properly typed
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken ?? (Zone.current[#blocCancelKey] as CancelToken?),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Perform HTTP DELETE request.
  ///
  /// [url] - Endpoint path (appended to baseUrl).
  /// [data] - Request body (optional).
  /// [queryParameters] - URL query parameters.
  /// [options] - Additional Dio request options.
  /// [cancelToken] - Token to cancel the request.
  Future<Response<dynamic>> delete(
    String url, {
    Object? data, // FIXED: Was 'data,' (dynamic) - now properly typed
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete<dynamic>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken ?? (Zone.current[#blocCancelKey] as CancelToken?),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
