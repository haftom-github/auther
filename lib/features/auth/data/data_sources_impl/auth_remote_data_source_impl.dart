import 'package:auther/features/auth/data/models/token_model.dart';
import 'package:auther/features/auth/data/models/user_model.dart';

import '../data_sources/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  @override
  Future<TokenModel?> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<TokenModel?> signInWithUsernameAndPassword(String username, String password) {
    // TODO: implement signInWithUsernameAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
