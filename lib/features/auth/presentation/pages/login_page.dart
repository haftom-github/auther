import 'package:auther/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
          listener: (ctx, state) {
            if (state.status == AuthStatus.authenticated) {
              Navigator.of(ctx).pushReplacementNamed('/home');
            }
          },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: LoginForm(),
        )
      ),
    );
  }
}