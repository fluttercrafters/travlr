// GoRouter configuration
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travlr/features/auth/bloc/auth_bloc.dart';
import 'package:travlr/features/auth/signin/pages/signin_page.dart';
import 'package:travlr/features/home/home.dart';

 abstract class TravlrRoutes {
  static const signIn = '/sign-in';
  static const home = '/';
 }

final appRouter = GoRouter(
  initialLocation: TravlrRoutes.home,
  routes: [
    GoRoute(
      path: TravlrRoutes.signIn,
      builder: (context, state) => BlocListener<AuthBloc, AuthState>(
        listener: (lContext, state) {
          if (state.status == AuthStatus.authenticated) {
            lContext.replace(TravlrRoutes.home);
          }
        },
        child: const SignInPage(),
      ),
    ),
    GoRoute(
      path: TravlrRoutes.home,
      builder: (context, state) => BlocListener<AuthBloc, AuthState>(
        listener: (lContext, state) {
          if (state.status == AuthStatus.unknown ||
              state.status == AuthStatus.unauthenticated) {
            lContext.replace(TravlrRoutes.signIn);
          }
        },
        child: const HomePage(),
      ),
    ),
  ],
  redirect: (context, state) {
    final authState = context.read<AuthBloc>().state;

    if (authState.status != AuthStatus.authenticated) {
      return TravlrRoutes.signIn;
    }

    return null;
  },
);
