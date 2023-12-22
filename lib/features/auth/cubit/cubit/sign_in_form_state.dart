part of 'sign_in_form_cubit.dart';

class SignInFormState extends Equatable {
  const SignInFormState({
    this.email = '',
    this.password = '',
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [
        email,
        password,
      ];

  SignInFormState copyWith({
    String? email,
    String? password,
  }) {
    return SignInFormState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
