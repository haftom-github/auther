import '../repositories/auth_repository.dart';

class SignOut {
  final AuthRepository authRepository;
  SignOut(this.authRepository);

  Future<void> call () async {
    await authRepository.signOut();
  }
}