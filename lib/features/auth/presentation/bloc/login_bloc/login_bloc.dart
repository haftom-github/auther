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
    on<LoginSubmitted>(_onSubmitted);
  }

  FutureOr<void> _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
    ));
  }

  FutureOr<void> _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
    ));
  }

  FutureOr<void> _onSubmitted(LoginSubmitted event, Emitter<LoginState> emit) {
    if (!state.isValid) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
      ));
    } else {
      emit(state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ));
      try {
        authBloc.add(LoginRequested(email: state.email.value, password: state.password.value));
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
