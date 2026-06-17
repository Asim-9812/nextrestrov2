import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import 'package:nextrestro/features/login/data/models/login_request.dart';
import 'package:nextrestro/features/login/data/models/login_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginRemoteDataSourceProvider = Provider<LoginRemoteDataSource>((ref) {
  return LoginRemoteDataSourceImpl(ref.read(apiClientProvider));
});

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiClient _apiClient;

  LoginRemoteDataSourceImpl(this._apiClient);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _apiClient.post(
      ApiConstants.loginEndpoint,
      data: request.toJson(),
    );

    if (response.data != null) {
      return LoginResponse.fromJson(response.data);
    } else {
      throw Exception('Login failed: Empty response from server');
    }
  }
}
