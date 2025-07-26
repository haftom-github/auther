import 'package:auther/features/auth/data/models/token_model.dart';

abstract class AuthRemoteDataSource {
  Future<TokenModel?> signInWithGoogle();
  Future<TokenModel?> signInWithUsernameAndPassword(String username, String password);
  Future<void> signOut();
}