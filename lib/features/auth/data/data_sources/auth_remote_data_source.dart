import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel?> signInWithGoogle();
  Future<UserModel?> signInWithUsernameAndPassword(String username, String password);
  Future<void> signOut();
}