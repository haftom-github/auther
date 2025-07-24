import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  // create a validation regex for password
  // password must be at least 8 characters long
  // password must contain at least one letter and one number
  static final _passwordRegex = RegExp(r'^[a-zA-Z0-9]{8,}$');

  @override
  PasswordValidationError? validator(String value) => _passwordRegex.hasMatch(value) ? null : PasswordValidationError.invalid;
}