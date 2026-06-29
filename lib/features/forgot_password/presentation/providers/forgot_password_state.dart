import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loading() = _Loading;
  const factory ForgotPasswordState.otpSent(String email) = _OtpSent;
  const factory ForgotPasswordState.success() = _Success;
  const factory ForgotPasswordState.error(String message) = _Error;
}
