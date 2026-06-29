import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';

abstract class ForgotPasswordRepository {
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, String>> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  });
}
