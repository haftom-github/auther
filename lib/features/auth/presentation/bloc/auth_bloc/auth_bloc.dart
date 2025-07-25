import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<UsernameLoginRequested>(_onLoginWithUsername);
    on<GoogleLoginRequested>(_onGoogleLogin);
    on<LogoutRequested>(_onLogout);
    on<AuthStatusRequested>(_onCheckAuthStatus);
  }

  FutureOr<void> _onLogout(LogoutRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
    ));
  }

  FutureOr<void> _onCheckAuthStatus(AuthStatusRequested event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
    ));
  }

  FutureOr<void> _onLoginWithUsername(UsernameLoginRequested event, Emitter<AuthState> emit) {
    try {
      emit(state.copyWith(status: AuthStatus.unknown));

      // await Future.delayed(const Duration(seconds: 3));
      if (event.username == 'test@example.com' && event.password == '12345678') {
        emit(state.copyWith(
          status: AuthStatus.authenticated,
          token: 'dummy token',
        ));
      } else {
        emit(state.copyWith(
          status: AuthStatus.unauthenticated,
          error: 'Invalid credentials',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        error: e.toString(),
      ));
    }
  }

  FutureOr<void> _onGoogleLogin(GoogleLoginRequested event, Emitter<AuthState> emit) {

  }
}