part of 'sign_in_form_cubit.dart';

class SignInFormState extends Equatable with FormzMixin {
  const SignInFormState({
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
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
