import 'package:auther/core/di/injection.dart';
import 'package:auther/features/auth/domain/usecases/signout.dart';

import '../../features/auth/data/data_sources/auth_local_data_source.dart';
import '../../features/auth/data/data_sources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/signin_with_google.dart';
import '../../features/auth/domain/usecases/signin_with_username.dart';

Future<void> setupDomainDi() async {
  getIt.registerLazySingleton<AuthRepository>(()
    => AuthRepositoryImpl(getIt.get<AuthRemoteDataSource>(), getIt.get<AuthLocalDataSource>()));
  getIt.registerLazySingleton<SignInWithGoogle>(() => SignInWithGoogle(getIt.get<AuthRepository>()));
  getIt.registerLazySingleton<SignInWithUsername>(() => SignInWithUsername(getIt.get<AuthRepository>()));
  getIt.registerLazySingleton<SignOut>(() => SignOut(getIt.get<AuthRepository>()));
}