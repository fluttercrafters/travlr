import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travlr/core/validators/email.dart';
import 'package:travlr/features/auth/signin/cubit/sign_in_form_cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInFormCubit(
        context.read(),
      ),
      child: const _SignInForm(),
    );
  }
}

class _SignInForm extends StatefulWidget {
  const _SignInForm();

  @override
  State<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  @override
  Widget build(BuildContext context) {
    final email = context.watch<SignInFormCubit>().state.email;
    final password = context.watch<SignInFormCubit>().state.password;
    final isValid = context.watch<SignInFormCubit>().state.isValid;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const FlutterLogo(
          size: 150,
        ),
        const Gap(32),
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText:
                      email.displayError != null ? emailError(email) : null,
                ),
                initialValue: email.value,
                onChanged: context.read<SignInFormCubit>().onEmailChanged,
              ),
              const Gap(8),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: password.displayError != null
                      ? 'Password must be at least 6 characters long.'
                      : null,
                ),
                obscureText: true,
                obscuringCharacter: 'o',
                keyboardType: TextInputType.emailAddress,
                initialValue: password.value,
                onChanged: context.read<SignInFormCubit>().onPasswordChanged,
              ),
            ],
          ),
        ),
        const Gap(16),
        ElevatedButton(
          onPressed:
              isValid ? () => context.read<SignInFormCubit>().submit() : null,
          child: const Text('Sign In'),
        ),
      ],
    );
  }

  String emailError(EmailInput email) {
    if (email.displayError == EmailError.empty) {
      return 'This field is required.';
    }

    return 'Invalid email';
  }
}
