import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import 'package:nextrestro/features/users/data/data_sources/user_remote_data_source.dart';
import 'package:nextrestro/features/users/data/models/user_model.dart';
import 'package:nextrestro/features/users/domain/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.read(userRemoteDataSourceProvider));
});

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<UserModel>>> getAllUsers() async {
    try {
      final response = await _remoteDataSource.getAllUsers();
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserById(int userId) async {
    try {
      final response = await _remoteDataSource.getUserById(userId);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> register(Map<String, dynamic> data) async {
    try {
      await _remoteDataSource.register(data);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
