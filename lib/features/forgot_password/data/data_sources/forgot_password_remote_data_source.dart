import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';

final forgotPasswordRemoteDataSourceProvider = Provider<ForgotPasswordRemoteDataSource>((ref) {
  return ForgotPasswordRemoteDataSourceImpl(ref.read(apiClientProvider));
});

abstract class ForgotPasswordRemoteDataSource {
  Future<String> forgotPassword(String email);
  Future<String> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  });
}

class ForgotPasswordRemoteDataSourceImpl implements ForgotPasswordRemoteDataSource {
  final ApiClient _apiClient;

  ForgotPasswordRemoteDataSourceImpl(this._apiClient);

  @override
  Future<String> forgotPassword(String email) async {
    final response = await _apiClient.post(
      ApiConstants.forgotPasswordEndpoint,
      queryParameters: {'email': email},
    );

    if (response.statusCode == 200) {
      if (response.data is Map) {
        return response.data['message'] ?? 'OTP sent successfully';
      }
      return response.data.toString();
    } else {
      if (response.data is Map) {
        throw Exception(response.data['message'] ?? 'Failed to send OTP');
      }
      throw Exception(response.data?.toString() ?? 'Failed to send OTP');
    }
  }

  @override
  Future<String> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    final response = await _apiClient.post(
      ApiConstants.resetPasswordEndpoint,
      queryParameters: {
        'email': email,
        'otp': otp,
        'newPassword': newPassword,
      },
    );

    if (response.statusCode == 200) {
      if (response.data is Map) {
        return response.data['message'] ?? 'Password reset successful';
      }
      return response.data.toString();
    } else {
      if (response.data is Map) {
        throw Exception(response.data['message'] ?? 'Failed to reset password');
      }
      throw Exception(response.data?.toString() ?? 'Failed to reset password');
    }
  }
}
