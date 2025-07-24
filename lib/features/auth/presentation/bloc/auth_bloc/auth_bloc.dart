import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginRequested>(_onLogin);
    on<LogoutRequested>(_onLogout);
    on<AuthStatusRequested>(_onCheckAuthStatus);
  }

  // login handler
  FutureOr<void> _onLogin(LoginRequested event, Emitter<AuthState> emit) async {

    try {
      emit(state.copyWith(status: AuthStatus.unknown));

      // await Future.delayed(const Duration(seconds: 3));
      if (event.email == 'test@example.com' && event.password == '12345678') {
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

  FutureOr<void> _onLogout(LogoutRequested event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
    ));
  }

  FutureOr<void> _onCheckAuthStatus(AuthStatusRequested event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
    ));
  }
}