import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import 'package:nextrestro/features/users/data/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  return UserRemoteDataSourceImpl(ref.read(apiClientProvider));
});

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getAllUsers();
  Future<UserModel> getUserById(int userId);
  Future<void> register(Map<String, dynamic> data);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient _apiClient;

  UserRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<UserModel>> getAllUsers() async {
    final response = await _apiClient.get(ApiConstants.getAllUsersEndpoint);
    if (response.data is List) {
      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    }
    return [];
  }

  @override
  Future<UserModel> getUserById(int userId) async {
    final response = await _apiClient.get(
      ApiConstants.getUserByIdEndpoint,
      queryParameters: {'userId': userId},
    );

    if (response.data != null) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch user: Empty response');
    }
  }

  @override
  Future<void> register(Map<String, dynamic> data) async {
    await _apiClient.post(
      ApiConstants.registerEndpoint,
      data: data,
    );
  }
}
