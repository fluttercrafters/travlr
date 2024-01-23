import 'package:formz/formz.dart';

enum EmailError { empty, invalid }

class EmailInput extends FormzInput<String, EmailError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty(super.value) : super.dirty();


  @override
  EmailError? validator(String value) {
    if (value.isEmpty) {
      return EmailError.empty;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return EmailError.invalid;
    }
    return null;
  }
}
