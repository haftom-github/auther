import 'package:auther/core/di/injection.dart';
import 'package:auther/features/auth/data/data_sources/auth_remote_data_source.dart';

import '../../features/auth/data/data_sources/auth_local_data_source.dart';
import '../../features/auth/data/data_sources_impl/auth_local_data_source_impl.dart';
import '../../features/auth/data/data_sources_impl/auth_remote_data_source_impl.dart';

Future<void> setupDataDi() async {
  getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  getIt.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl());
}