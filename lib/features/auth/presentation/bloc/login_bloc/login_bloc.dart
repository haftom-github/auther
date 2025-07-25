import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../domain/value_objects/email.dart';
import '../../../domain/value_objects/password.dart';
import '../auth_bloc/auth_bloc.dart';

part 'login_state.dart';
part 'login_event.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc authBloc;
  LoginBloc({required this.authBloc}) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginHit>(_onSubmitted);
  }

  FutureOr<void> _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) async {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: FormzSubmissionStatus.initial,
    ));
  }

  Future<void> _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) async {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: FormzSubmissionStatus.initial,
    ));
  }

  Future<void> _onSubmitted(LoginHit event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
    ));
    if (!state.isValid) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
      ));
    } else {
      try {
        await Future.delayed(const Duration(seconds: 3));
        switch (event.provider) {
          case AuthProvider.google:
            // authBloc.add(GoogleLoginRequested());
            break;
          case AuthProvider.facebook:
            // TODO: Implement Facebook OAuth logic
            break;
          case AuthProvider.twitter:
            // TODO: Implement Twitter OAuth logic
            break;
          case AuthProvider.username:
            authBloc.add(
                UsernameLoginRequested(username: state.email.value, password: state.password.value)
            );
        }
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          error: e.toString(),
        ));
      }
    }
  }
}
