import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import 'package:nextrestro/features/users/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> getUserById(int userId);
}
