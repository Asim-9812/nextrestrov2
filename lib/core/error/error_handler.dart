import 'dart:io';

import 'package:dio/dio.dart';

import 'exception.dart';
import 'failures.dart';

class ErrorHandler {
  static Failure handleException(dynamic exception) {
    if (exception is DioException) {
      return _handleDioException(exception);
    } else if (exception is AppException) {
      return _handleAppException(exception);
    } else if (exception is TimeoutException) {
      return TimeoutFailure('Request timeout. Please try again.');
    } else {
      return UnknownFailure(exception.toString());
    }
  }

  static Failure _handleDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;
        return _handleStatusCode(statusCode, exception);
      case DioExceptionType.connectionTimeout:
        return TimeoutFailure('Connection timeout. Please check your internet.');
      case DioExceptionType.receiveTimeout:
        return TimeoutFailure('Server response timeout. Please try again.');
      case DioExceptionType.sendTimeout:
        return TimeoutFailure('Request timeout. Please try again.');
      case DioExceptionType.badCertificate:
        return NetworkFailure('SSL certificate error. Please try again.');
      case DioExceptionType.connectionError:
        return NetworkFailure('No internet connection. Please check your network.');
      case DioExceptionType.unknown:
        if (exception.error is SocketException) {
          return NetworkFailure('Network error. Please check your connection.');
        }
        return UnknownFailure('An unexpected error occurred.');
      default:
        return UnknownFailure('An unexpected error occurred.');
    }
  }

  static Failure _handleStatusCode(int? statusCode, DioException exception) {
    final responseData = exception.response?.data;
    final errorMessage = _extractErrorMessage(responseData);

    switch (statusCode) {
      case 400:
        return ValidationFailure(errorMessage ?? 'Invalid request. Please check your input.');
      case 401:
        return UnauthorizedFailure(errorMessage ?? 'Unauthorized. Please login again.');
      case 403:
        return ForbiddenFailure(errorMessage ?? 'You do not have permission to access this resource.');
      case 404:
        return NotFoundFailure(errorMessage ?? 'The requested resource was not found.');
      case 500:
        return ServerFailure(errorMessage ?? 'Server error. Please try again later.');
      case 502:
        return ServerFailure('Bad gateway. Please try again later.');
      case 503:
        return ServerFailure('Service unavailable. Please try again later.');
      default:
        return ServerFailure(errorMessage ?? 'An error occurred. Status code: $statusCode');
    }
  }

  static Failure _handleAppException(AppException exception) {
    if (exception is ServerException) {
      return ServerFailure(exception.message);
    } else if (exception is NetworkException) {
      return NetworkFailure(exception.message);
    } else if (exception is CacheException) {
      return CacheFailure(exception.message);
    } else if (exception is ValidationException) {
      return ValidationFailure(exception.message);
    } else if (exception is UnauthorizedException) {
      return UnauthorizedFailure(exception.message);
    } else if (exception is ForbiddenException) {
      return ForbiddenFailure(exception.message);
    } else if (exception is NotFoundException) {
      return NotFoundFailure(exception.message);
    } else if (exception is TimeoutException) {
      return TimeoutFailure(exception.message);
    }
    return UnknownFailure(exception.message);
  }

  static String? _extractErrorMessage(dynamic responseData) {
    if (responseData is Map<String, dynamic>) {
      if (responseData.containsKey('message')) {
        return responseData['message'];
      } else if (responseData.containsKey('error')) {
        return responseData['error'];
      } else if (responseData.containsKey('errors')) {
        final errors = responseData['errors'];
        if (errors is List && errors.isNotEmpty) {
          return errors.first.toString();
        }
      }
    }
    return null;
  }
}
