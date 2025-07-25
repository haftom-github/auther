import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignInWithUsername {
  final AuthRepository authRepository;
  SignInWithUsername({required this.authRepository});

  Future<User?> call(String username, String password) async {
    return await authRepository.signInWithUsernameAndPassword(username, password);
  }
}