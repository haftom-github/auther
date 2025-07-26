import 'package:auther/features/auth/domain/entities/token.dart';
import 'package:auther/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Token>> signInWithUsernameAndPassword(String username, String password);
  Future<Either<Failure, Token>> signInWithGoogle();
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<Either<Failure, User>> getSignedInUser();
}