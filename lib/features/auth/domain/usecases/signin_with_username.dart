import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/token.dart';
import '../repositories/auth_repository.dart';

class SignInWithUsername {
  final AuthRepository authRepository;
  SignInWithUsername(this.authRepository);

  Future<Either<Failure, Token>> call(String username, String password) async {
    return await authRepository.signInWithUsernameAndPassword(username, password);
  }
}