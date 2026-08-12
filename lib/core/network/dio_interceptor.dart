import 'package:dio/dio.dart';
import '../utils/app_logger.dart';

class AppDioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.i('🌐 REQUEST[${options.method}] => PATH: ${options.path}');
    AppLogger.d('Headers: ${options.headers}');
    if (options.data != null) {
      AppLogger.d('Body: ${options.data}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.i(
        '✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    AppLogger.v('Data: ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.e(
        '❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
        err.error,
        err.stackTrace);
    return super.onError(err, handler);
  }
}
