import 'package:auther/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel?> getCashedUser();
  Future<void> cacheUser(UserModel user);
  Future<void> removeCashedUser();
  Future<bool> isUserCashed();
}
