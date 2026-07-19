import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:nextrestro/core/error/exception.dart';
import 'package:nextrestro/core/network/session_service.dart';

import 'api_constants.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  final sessionService = ref.read(sessionServiceProvider);
  return ApiClient(sessionService);
});

class ApiClient {
  late Dio _dio;
  final Logger _logger = Logger();
  final SessionService _sessionService;

  ApiClient(this._sessionService) {
    _initializeDio();
  }

  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectionTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors
    _dio.interceptors.add(_LoggingInterceptor(_logger));
    _dio.interceptors.add(_AuthInterceptor(_sessionService));
    _dio.interceptors.add(_ErrorInterceptor(_sessionService));

    // Temporary bypass for SSL testing
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Dio get dio => _dio;

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      _logger.e('GET Error: $endpoint', error: e);
      rethrow;
    } catch (e) {
      _logger.e('Unexpected Error: $endpoint', error: e);
      rethrow;
    }
  }

  Future<Response> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      _logger.e('POST Error: $endpoint', error: e);
      rethrow;
    } catch (e) {
      _logger.e('Unexpected Error: $endpoint', error: e);
      rethrow;
    }
  }

  Future<Response> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      _logger.e('PUT Error: $endpoint', error: e);
      rethrow;
    } catch (e) {
      _logger.e('Unexpected Error: $endpoint', error: e);
      rethrow;
    }
  }

  Future<Response> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      _logger.e('DELETE Error: $endpoint', error: e);
      rethrow;
    } catch (e) {
      _logger.e('Unexpected Error: $endpoint', error: e);
      rethrow;
    }
  }

  Future<Response> patch(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      _logger.e('PATCH Error: $endpoint', error: e);
      rethrow;
    } catch (e) {
      _logger.e('Unexpected Error: $endpoint', error: e);
      rethrow;
    }
  }

  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void removeAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}

class _LoggingInterceptor extends Interceptor {
  final Logger logger;

  _LoggingInterceptor(this.logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i(
      'REQUEST: ${options.method} ${options.path}',
      error: options.data,
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
      'RESPONSE: ${response.statusCode} ${response.requestOptions.path}',
      error: response.data,
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e(
      'ERROR: ${err.response?.statusCode} ${err.requestOptions.path}',
      error: err.response?.data ?? err.message,
    );
    super.onError(err, handler);
  }
}

class _AuthInterceptor extends Interceptor {
  final SessionService _sessionService;

  _AuthInterceptor(this._sessionService);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _sessionService.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}

class _ErrorInterceptor extends Interceptor {
  final SessionService _sessionService;

  _ErrorInterceptor(this._sessionService);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle specific status codes
    if (err.response?.statusCode == 401) {
      // Token expired or invalid
      _sessionService.clearSession();
      // You can also emit an event or use a GlobalKey for navigation if needed,
      // but clearing the session will usually trigger a UI change if observing session state.
    }
    super.onError(err, handler);
  }
}
