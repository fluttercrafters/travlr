import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travlr/features/auth/cubit/cubit/sign_in_form_cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInFormCubit(),
      child: const _SignInForm(),
    );
  }
}

class _SignInForm extends StatefulWidget {
  const _SignInForm({super.key});

  @override
  State<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  @override
  Widget build(BuildContext context) {
    final email = context.watch<SignInFormCubit>().state.email;
    final password = context.watch<SignInFormCubit>().state.password;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                initialValue: email,
                onChanged: context.read<SignInFormCubit>().onEmailChanged,
              ),
              const Gap(8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                initialValue: password,
                onChanged: context.read<SignInFormCubit>().onPasswordChanged,
              ),
            ],
          ),
        ),
        const Gap(16),
        ElevatedButton(
          onPressed: () => context.read<SignInFormCubit>().submit(),
          child: const Text('Sign In'),
        ),
      ],
    );
  }
}
