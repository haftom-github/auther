import 'package:auther/features/auth/domain/entities/user.dart';
import 'package:auther/features/auth/domain/repositories/auth_repository.dart';

import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource, this._authLocalDataSource);

  @override
  Future<User?> getSignedInUser() async {
    final user = await _authLocalDataSource.getCashedUser();
    return user?.toEntity();
  }

  @override
  Future<bool> isSignedIn() async {
    final user = await _authLocalDataSource.getCashedUser();
    return user != null;
  }

  @override
  Future<User?> signInWithGoogle() async {
    final user = await _authRemoteDataSource.signInWithGoogle();
    if (user == null) return null;
    await _authLocalDataSource.cacheUser(user);
    return user.toEntity();
  }

  @override
  Future<User?> signInWithUsernameAndPassword(String username, String password) async {
    final user = await _authRemoteDataSource.signInWithUsernameAndPassword(username, password);
    if (user == null) return null;
    await _authLocalDataSource.cacheUser(user);
    return user.toEntity();
  }

  @override
  Future<void> signOut() async {
    await _authLocalDataSource.removeCashedUser();
    throw UnimplementedError();
  }
}