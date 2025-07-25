part of 'auth_bloc.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? token;
  final String? error;
  final AuthProvider provider;
  final bool isOAuthInProgress;

  const AuthState({
    this.provider = AuthProvider.username,
    this.isOAuthInProgress = false,
    this.status = AuthStatus.unknown,
    this.token,
    this.error,
  });

  AuthState copyWith({
    AuthStatus? status,
    AuthProvider? provider,
    bool? isOAuthInProgress,
    String? token,
    String? error,
  }) {
    return AuthState(
      provider: provider ?? this.provider,
      isOAuthInProgress: isOAuthInProgress ?? this.isOAuthInProgress,
      status: status ?? this.status,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, token, error, provider, isOAuthInProgress];

}