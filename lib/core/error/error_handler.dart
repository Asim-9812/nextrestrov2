import 'failure.dart';

class ErrorHandler {
  static String mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is CacheFailure) {
      return 'Cache error occurred';
    } else {
      return 'Unexpected error';
    }
  }
}
