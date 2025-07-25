import 'dart:async';

import 'package:auther/features/auth/domain/usecases/signin_with_google.dart';
import 'package:auther/features/auth/domain/usecases/signout.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/usecases/signin_with_username.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogle _signInWithGoogle;
  final SignInWithUsername _signInWithUsername;
  final SignOut _signOut;
  AuthBloc(this._signInWithGoogle, this._signInWithUsername, this._signOut)
      : super(const AuthState()) {

    on<UsernameSignInRequested>(_onLoginWithUsername);
    on<GoogleSignInRequested>(_onGoogleSignIn);
    on<LogoutRequested>(_onSignOut);
    on<AuthStatusRequested>(_onCheckAuthStatus);
  }

  FutureOr<void> _onSignOut(LogoutRequested event, Emitter<AuthState> emit) async {
    await _signOut();
    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
    ));
  }

  FutureOr<void> _onCheckAuthStatus(AuthStatusRequested event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
    ));
  }

  FutureOr<void> _onLoginWithUsername(UsernameSignInRequested event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.unknown));

      // await Future.delayed(const Duration(seconds: 3));
      final user = await _signInWithUsername(event.username, event.password);
      if (user != null) {
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

  FutureOr<void> _onGoogleSignIn(GoogleSignInRequested event, Emitter<AuthState> emit) async {
    final user = await _signInWithGoogle();
    if (user != null) {
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        token: 'dummy token',
      ));
    } else {
      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        error: 'Something went wrong',
      ));
    }
  }
}