import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository authRepository;
  SignInWithGoogle(this.authRepository);

  Future<User?> call() async {
    return await authRepository.signInWithGoogle();
  }
}