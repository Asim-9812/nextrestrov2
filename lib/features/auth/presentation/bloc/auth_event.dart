import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  const LoginEvent({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final String phone;

  const RegisterEvent({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phone,
  });

  @override
  List<Object> get props => [email, password, fullName, phone];
}

class LogoutEvent extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

class ForgotPasswordEvent extends AuthEvent {
  final String email;
  const ForgotPasswordEvent(this.email);

  @override
  List<Object> get props => [email];
}

class ResetPasswordEvent extends AuthEvent {
  final String email;
  final String otp;
  final String newPassword;

  const ResetPasswordEvent({
    required this.email,
    required this.otp,
    required this.newPassword,
  });

  @override
  List<Object> get props => [email, otp, newPassword];
}

class FetchProfileEvent extends AuthEvent {}
