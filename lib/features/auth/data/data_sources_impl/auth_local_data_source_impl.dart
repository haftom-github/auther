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

}