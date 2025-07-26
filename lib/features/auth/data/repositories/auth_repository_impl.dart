import 'package:auther/features/auth/domain/entities/token.dart';
import 'package:auther/features/auth/domain/entities/user.dart';
import 'package:auther/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource, this._authLocalDataSource);

  @override
  Future<Either<Failure, User>> getSignedInUser() async {
    final user = await _authLocalDataSource.getCashedUser();
    return user?.toEntity();
  }

  @override
  Future<bool> isSignedIn() async {
    final user = await _authLocalDataSource.getCashedUser();
    return user != null;
  }

  @override
  Future<Either<Failure, Token>> signInWithGoogle() async {
    final token = await _authRemoteDataSource.signInWithGoogle();
    if (token == null) return null;
    await _authLocalDataSource.cacheToken(token);
    return token.toEntity();
  }

  @override
  Future<Either<Failure, Token>> signInWithUsernameAndPassword(String username, String password) async {
    final token = await _authRemoteDataSource.signInWithUsernameAndPassword(username, password);
    if (token == null) return null;
    await _authLocalDataSource.cacheToken(token);
    return token.toEntity();
  }

  @override
  Future<void> signOut() async {
    await _authLocalDataSource.removeCashedUser();
    throw UnimplementedError();
  }
}