part of 'auth_bloc.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? token;
  final String? error;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.token,
    this.error,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? token,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, token, error];

}