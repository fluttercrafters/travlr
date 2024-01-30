// GoRouter configuration
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travlr/core/app/not_found.dart';
import 'package:travlr/features/auth/bloc/auth_bloc.dart';
import 'package:travlr/features/auth/signin/pages/signin_page.dart';
import 'package:travlr/features/discover/search_results/pages/search_results_page.dart';
import 'package:travlr/features/home/home.dart';
import 'package:travlr/features/splash/splash.dart';

abstract class TravlrRoutes {
  static const signIn = '/sign-in';
  static const home = '/';
  static const splash = '/splash';
  static const notFound = '/404';
  static const discoverSearch = '/discover/search';
}

Widget requireGuest(Widget child) {
  return BlocListener<AuthBloc, AuthState>(
    listener: (lContext, state) {
      if (state.status == AuthStatus.authenticated) {
        lContext.replace(TravlrRoutes.home);
      }
    },
    child: child,
  );
}

Widget requireAuthentication(Widget child) {
  return BlocListener<AuthBloc, AuthState>(
    listener: (lContext, state) {
      if (state.status == AuthStatus.unknown) {
        lContext.replace(TravlrRoutes.splash);
      }

      if (state.status == AuthStatus.unauthenticated) {
        lContext.replace(TravlrRoutes.signIn);
      }
    },
    child: child,
  );
}

Widget awaitAuthentication(Widget child) {
  return BlocListener<AuthBloc, AuthState>(
    listener: (lContext, state) {
      if (state.status == AuthStatus.authenticated) {
        lContext.replace('${TravlrRoutes.home}?tab=1');
      }

      if (state.status == AuthStatus.unauthenticated) {
        lContext.replace(TravlrRoutes.signIn);
      }
    },
    child: child,
  );
}

MaterialPage<T> _buildPage<T>(
  Key key,
  Widget child,
) =>
    MaterialPage<T>(child: child);

final appRouter = GoRouter(
  initialLocation: TravlrRoutes.splash,
  debugLogDiagnostics: true,
  onException: (_, state, router) {
    router.go(TravlrRoutes.notFound, extra: state.uri.toString());
  },
  routes: [
    GoRoute(
      path: TravlrRoutes.signIn,
      pageBuilder: (context, state) => _buildPage<void>(
        state.pageKey,
        requireGuest(const SignInPage()),
      ),
    ),
    GoRoute(
      path: TravlrRoutes.home,
      pageBuilder: (context, state) {
        final tab = state.uri.queryParameters['tab'] ?? '';
        return _buildPage<void>(
          state.pageKey,
          requireAuthentication(
            HomePage(
              initialIndex: int.tryParse(tab) ?? 1, // Discover tab as default.
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: TravlrRoutes.notFound,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return _buildPage<void>(
          state.pageKey,
          const NotFoundPage(),
        );
      },
    ),
    GoRoute(
      path: TravlrRoutes.splash,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return _buildPage<void>(
            state.pageKey,
            awaitAuthentication(
              const SplashPage(),
            ));
      },
    ),
    GoRoute(
      path: TravlrRoutes.discoverSearch,
      pageBuilder: (BuildContext context, GoRouterState state) {
        final searchTerm = state.uri.queryParameters['searchTerm'] ?? '';

        return _buildPage<void>(
            state.pageKey,
            requireAuthentication(
              SearchResultsPage(
                searchTerm: searchTerm,
              ),
            ));
      },
    ),
  ],
);
