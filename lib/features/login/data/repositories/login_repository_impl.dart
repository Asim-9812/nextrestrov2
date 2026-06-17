import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import 'package:nextrestro/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:nextrestro/features/login/data/models/login_request.dart';
import 'package:nextrestro/features/login/data/models/login_response.dart';
import 'package:nextrestro/features/login/domain/repositories/login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepositoryImpl(ref.read(loginRemoteDataSourceProvider));
});

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _remoteDataSource;

  LoginRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    try {
      final response = await _remoteDataSource.login(request);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
