import 'package:auther/features/auth/domain/entities/token.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository authRepository;
  SignInWithGoogle(this.authRepository);

  Future<Either<Failure, Token>> call() async {
    return await authRepository.signInWithGoogle();
  }
}