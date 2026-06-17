import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import 'package:nextrestro/features/login/data/models/login_request.dart';
import 'package:nextrestro/features/login/data/models/login_response.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponse>> login(LoginRequest request);
}
