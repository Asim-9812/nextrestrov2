import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String username, String password);
  Future<void> register({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  });
  Future<void> forgotPassword(String email);
  Future<void> resetPassword(String email, String otp, String newPassword);
  Future<UserModel> getProfile();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  @override
  Future<UserModel> login(String username, String password) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.login,
        data: {
          "userId": 0,
          "username": username,
          "password": password,
          "role": "string"
        },
      );
      return UserModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> register({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    try {
      final username = fullName.split(' ').first;
      final hireDate = DateTime.now().toUtc().toIso8601String();

      await _dioClient.post(
        ApiEndpoints.register,
        data: {
          "userID": 0,
          "username": username,
          "password": password,
          "email": email,
          "fullName": fullName,
          "phone": phone,
          "roleID": 1,
          "hireDate": hireDate,
          "isActive": true,
          "companyID": 1,
          "branchID": 1
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await _dioClient.post(
        ApiEndpoints.forgotPassword,
        queryParameters: {'email': email},
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email, String otp, String newPassword) async {
    try {
      await _dioClient.post(
        ApiEndpoints.resetPassword,
        queryParameters: {
          'email': email,
          'otp': otp,
          'newPassword': newPassword,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getProfile() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.profile);
      return UserModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
