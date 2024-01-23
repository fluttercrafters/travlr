import 'package:formz/formz.dart';

enum PasswordError { empty, short }

class PasswordInput extends FormzInput<String, PasswordError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty(super.value) : super.dirty();

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty) {
      return PasswordError.empty;
    }
    if (value.length < 6) {
      return PasswordError.short;
    }
    return null;
  }
}