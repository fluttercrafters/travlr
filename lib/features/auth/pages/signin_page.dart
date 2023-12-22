import 'package:flutter/material.dart';
import 'package:travlr/features/auth/widgets/signin_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static PageRoute route() {
    return MaterialPageRoute(
      builder: (_) => const SignInPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SignInForm(),
        ),
      ),
    );
  }
}
