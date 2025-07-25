part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];

}

enum AuthProvider { google, facebook, twitter, username }

abstract class LoginRequested extends AuthEvent {
  final AuthProvider scheme;
  const LoginRequested(this.scheme);

  @override
  List<Object?> get props => [scheme];
}

class UsernameLoginRequested extends LoginRequested {
  final String username;
  final String password;

  const UsernameLoginRequested({required this.username, required this.password}) : super(AuthProvider.username);

  @override
  List<Object?> get props => [username, password];
}

class GoogleLoginRequested extends LoginRequested {
  final String authorizationCode;
  final String? callbackUrl;
  const GoogleLoginRequested({
    required this.authorizationCode,
    required this.callbackUrl}) : super(AuthProvider.google);
}

class LogoutRequested extends AuthEvent {}

class AuthStatusRequested extends AuthEvent {}