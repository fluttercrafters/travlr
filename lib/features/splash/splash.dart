import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travlr/features/auth/bloc/auth_bloc.dart';
import 'package:travlr/features/auth/signin/pages/signin_page.dart';
import 'package:travlr/features/home/home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static PageRoute route() {
    return MaterialPageRoute(
      builder: (_) => const SplashPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthStatus.unknown:
            Navigator.of(context).pushAndRemoveUntil(
              SplashPage.route(),
              (route) => false,
            );
            break;
          case AuthStatus.authenticated:
            Navigator.of(context).pushAndRemoveUntil(
              HomePage.route(),
              (route) => false,
            );
            break;

          case AuthStatus.unauthenticated:
            Navigator.of(context).pushAndRemoveUntil(
              SignInPage.route(),
              (route) => false,
            );
            break;
        }
      },
      child: const Scaffold(
        body: Center(
          child: FlutterLogo(
            size: 150,
          ),
        ),
      ),
    );
  }
}
