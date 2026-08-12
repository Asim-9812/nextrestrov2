import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<CheckAuthEvent>(_onCheckAuth);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<RegisterEvent>(_onRegister);
    on<ForgotPasswordEvent>(_onForgotPassword);
    on<ResetPasswordEvent>(_onResetPassword);
    on<FetchProfileEvent>(_onFetchProfile);
  }

  Future<void> _onCheckAuth(CheckAuthEvent event, Emitter<AuthState> emit) async {
    final result = await authRepository.getCachedUser();
    result.fold(
      (failure) => emit(Unauthenticated()),
      (user) {
        if (user != null) {
          emit(Authenticated(user));
        } else {
          emit(Unauthenticated());
        }
      },
    );
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepository.login(event.username, event.password);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    await authRepository.logout();
    emit(Unauthenticated());
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepository.register(
      email: event.email,
      password: event.password,
      fullName: event.fullName,
      phone: event.phone,
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> _onForgotPassword(ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepository.forgotPassword(event.email);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(ForgotPasswordSuccess(event.email)),
    );
  }

  Future<void> _onResetPassword(ResetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepository.resetPassword(event.email, event.otp, event.newPassword);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(ResetPasswordSuccess()),
    );
  }

  Future<void> _onFetchProfile(FetchProfileEvent event, Emitter<AuthState> emit) async {
    final result = await authRepository.getProfile();
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(ProfileLoaded(user)),
    );
  }
}
