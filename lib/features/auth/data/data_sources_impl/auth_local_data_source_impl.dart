import 'package:auther/features/auth/data/models/token_model.dart';
import 'package:auther/features/auth/data/models/user_model.dart';

import '../data_sources/auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource{
  @override
  Future<void> cacheUser(UserModel user) {
    // TODO: implement cacheUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getCashedUser() {
    // TODO: implement getCashedUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isUserCashed() {
    // TODO: implement isUserCashed
    throw UnimplementedError();
  }

  @override
  Future<void> removeCashedUser() {
    // TODO: implement removeCashedUser
    throw UnimplementedError();
  }

  @override
  Future<void> cacheToken(TokenModel token) {
    // TODO: implement cacheToken
    throw UnimplementedError();
  }

  @override
  Future<TokenModel?> getCashedToken() {
    // TODO: implement getCashedToken
    throw UnimplementedError();
  }

  @override
  Future<bool> isTokenCashed() {
    // TODO: implement isTokenCashed
    throw UnimplementedError();
  }

  @override
  Future<void> removeCashedToken() {
    // TODO: implement removeCashedToken
    throw UnimplementedError();
  }

}