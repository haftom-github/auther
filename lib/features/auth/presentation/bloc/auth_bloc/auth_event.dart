part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];

}

enum AuthProvider { google, facebook, twitter, username }

abstract class SignInRequested extends AuthEvent {
  final AuthProvider scheme;
  const SignInRequested(this.scheme);

  @override
  List<Object?> get props => [scheme];
}

class UsernameSignInRequested extends SignInRequested {
  final String username;
  final String password;

  const UsernameSignInRequested({required this.username, required this.password}) : super(AuthProvider.username);

  @override
  List<Object?> get props => [username, password];
}

class GoogleSignInRequested extends SignInRequested {
  final String authorizationCode;
  final String? callbackUrl;
  const GoogleSignInRequested({
    required this.authorizationCode,
    required this.callbackUrl}) : super(AuthProvider.google);
}

class LogoutRequested extends AuthEvent {}

class AuthStatusRequested extends AuthEvent {}