import 'package:auther/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User?> signInWithUsernameAndPassword(String username, String password);
  Future<User?> signInWithGoogle();
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<User?> getSignedInUser();
}