import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/login/data/models/login_request.dart';
import 'package:nextrestro/features/login/data/models/login_response.dart';
import 'package:nextrestro/features/login/data/repositories/login_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.freezed.dart';
part 'login_provider.g.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(LoginResponse response) = _Success;
  const factory LoginState.error(String message) = _Error;
}

@riverpod
class Login extends _$Login {
  @override
  LoginState build() => const LoginState.initial();

  Future<void> login(String username, String password) async {
    state = const LoginState.loading();

    // TEMPORARY: Bypassing API logic as it is currently not working

    final request = LoginRequest(
      username: username,
      password: password,
      role: "string",
      userId: 0,
    );

    final result = await ref.read(loginRepositoryProvider).login(request);

    result.fold(
      (failure) => state = LoginState.error(failure.message),
      (response) async {
        await ref.read(sessionServiceProvider).saveSession(response);
        state = LoginState.success(response);
      },
    );


    // Simulate a successful login with Admin role
    // final mockResponse = LoginResponse(
    //   userId: 1,
    //   username: username.isEmpty ? "Admin" : username,
    //   role: "Admin",
    //   token: "mock_token",
    // );
    //
    // await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    // await ref.read(sessionServiceProvider).saveSession(mockResponse);
    // state = LoginState.success(mockResponse);
  }
}
