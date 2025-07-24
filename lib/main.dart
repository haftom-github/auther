import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => AuthBloc()),
        BlocProvider(create: (ctx) => LoginBloc(authBloc: ctx.read<AuthBloc>())),
      ],
      child: MaterialApp(
        title: 'Auther',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: BlocBuilder<AuthBloc, AuthState>(
            builder: (ctx, state) {
              if (state.status == AuthStatus.unauthenticated
                  || state.status == AuthStatus.unknown) {
                return const LoginPage();
              } else {
                return const HomePage();
              }
            }
        ),
        routes: {
          '/home': (ctx) => const HomePage(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) {
    return Scaffold(

    );
  }
}