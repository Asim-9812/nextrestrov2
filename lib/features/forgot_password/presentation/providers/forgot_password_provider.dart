import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nextrestro/features/forgot_password/data/repositories/forgot_password_repository_impl.dart';
import 'package:nextrestro/features/forgot_password/presentation/providers/forgot_password_state.dart';
import 'package:logger/logger.dart';

part 'forgot_password_provider.g.dart';

@riverpod
class ForgotPasswordNotifier extends _$ForgotPasswordNotifier {
  final _logger = Logger();

  @override
  ForgotPasswordState build() => const ForgotPasswordState.initial();

  Future<void> sendOtp(String email) async {
    state = const ForgotPasswordState.loading();
    _logger.i('Attempting to send OTP to $email');
    
    final repository = ref.read(forgotPasswordRepositoryProvider);
    final result = await repository.forgotPassword(email);

    result.fold(
      (failure) {
        _logger.e('Failed to send OTP: ${failure.message}');
        state = ForgotPasswordState.error(failure.message);
      },
      (message) {
        _logger.i('OTP sent successfully to $email');
        state = ForgotPasswordState.otpSent(email);
      },
    );
  }

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    state = const ForgotPasswordState.loading();
    _logger.i('Attempting to reset password for $email');

    final repository = ref.read(forgotPasswordRepositoryProvider);
    final result = await repository.resetPassword(
      email: email,
      otp: otp,
      newPassword: newPassword,
    );

    result.fold(
      (failure) {
        _logger.e('Failed to reset password: ${failure.message}');
        state = ForgotPasswordState.error(failure.message);
      },
      (message) {
        _logger.i('Password reset successful for $email');
        state = const ForgotPasswordState.success();
      },
    );
  }

  void resetToInitial() {
    state = const ForgotPasswordState.initial();
  }
}
