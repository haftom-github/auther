import 'package:auther/core/di/injection.dart';
import 'package:auther/features/auth/domain/usecases/signin_with_google.dart';
import 'package:auther/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import '../../features/auth/domain/usecases/signin_with_username.dart';
import '../../features/auth/domain/usecases/signout.dart';

Future<void> setupPresentationDi() async {
  getIt.registerFactory<AuthBloc>(()
    => AuthBloc(
        getIt.get<SignInWithGoogle>(),
        getIt.get<SignInWithUsername>(),
        getIt.get<SignOut>()));
}