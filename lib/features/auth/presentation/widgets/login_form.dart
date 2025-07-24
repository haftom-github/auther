import 'package:auther/features/auth/domain/value_objects/email.dart';
import 'package:auther/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../domain/value_objects/password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(context) {
    return BlocConsumer<LoginBloc, LoginState>(
        listener: (ctx, state) {
          if (state.status == FormzSubmissionStatus.failure) {
            ScaffoldMessenger.of(ctx)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(state.error ?? "login failed")),);
          }
        },
        builder: (ctx, state) {
          return Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'email@example.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    ctx.read<LoginBloc>().add(LoginEmailChanged(value));
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (_) =>
                    state.email.error == EmailValidationError.invalid
                    ? 'invalid email' : null,
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    ctx.read<LoginBloc>().add(LoginPasswordChanged(value));
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (_) {
                      return state.password.error == PasswordValidationError.invalid
                      ? 'invalid password' : null;
                  },

                ),
                const SizedBox(height: 16,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      animationDuration: Duration.zero,
                    ),
                      onPressed: state.status.isInProgress ? null : (){ctx.read<LoginBloc>().add(LoginSubmitted());},
                      child: state.status.isInProgress
                          ? const Text('Logging in...')
                          : const Text('Login')
                  )
                )
              ],
            )
          );
        }
    );
  }
}