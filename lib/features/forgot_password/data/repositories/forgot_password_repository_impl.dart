import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import 'package:nextrestro/features/forgot_password/data/data_sources/forgot_password_remote_data_source.dart';
import 'package:nextrestro/features/forgot_password/domain/repositories/forgot_password_repository.dart';

final forgotPasswordRepositoryProvider = Provider<ForgotPasswordRepository>((ref) {
  return ForgotPasswordRepositoryImpl(ref.read(forgotPasswordRemoteDataSourceProvider));
});

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordRemoteDataSource _remoteDataSource;

  ForgotPasswordRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    try {
      final result = await _remoteDataSource.forgotPassword(email);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      final result = await _remoteDataSource.resetPassword(
        email: email,
        otp: otp,
        newPassword: newPassword,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
