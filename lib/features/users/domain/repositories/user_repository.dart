import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import 'package:nextrestro/features/users/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserModel>>> getAllUsers();
  Future<Either<Failure, UserModel>> getUserById(int userId);
  Future<Either<Failure, void>> register(Map<String, dynamic> data);
}
