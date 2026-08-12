import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String username, String password);
  Future<Either<Failure, void>> register({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  });
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserEntity?>> getCachedUser();
  Future<Either<Failure, void>> forgotPassword(String email);
  Future<Either<Failure, void>> resetPassword(String email, String otp, String newPassword);
  Future<Either<Failure, UserEntity>> getProfile();
}
