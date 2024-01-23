part of 'sign_in_form_cubit.dart';

class SignInFormState extends Equatable with FormzMixin {
  const SignInFormState({
    this.email = const EmailInput.dirty('me@codingale.dev'),
    this.password = const PasswordInput.dirty('P@ssw0rd'),
  });

  final EmailInput email;
  final PasswordInput password;

  @override
  List<Object> get props => [
        email,
        password,
      ];

  @override
  List<FormzInput> get inputs => [
        email,
        password,
      ];

  SignInFormState copyWith({
    EmailInput? email,
    PasswordInput? password,
  }) {
    return SignInFormState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
