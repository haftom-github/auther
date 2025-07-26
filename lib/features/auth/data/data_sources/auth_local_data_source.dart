import 'package:auther/features/auth/data/models/user_model.dart';

import '../models/token_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(TokenModel token);
  Future<TokenModel?> getCashedToken();
  Future<void> removeCashedToken();
  Future<bool> isTokenCashed();

  Future<UserModel?> getCashedUser();
  Future<void> cacheUser(UserModel user);
  Future<void> removeCashedUser();
  Future<bool> isUserCashed();
}
