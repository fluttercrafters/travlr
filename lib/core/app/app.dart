import 'package:domain/repositories/config_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travlr/features/auth/auth.dart';
import 'package:travlr/features/auth/bloc/auth_bloc.dart';
import 'package:travlr/features/home/home.dart';
import 'package:travlr/features/splash/splash.dart';

class TravlrApp extends StatelessWidget {
  const TravlrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            context.read(),
          ),
        ),
      ],
      child: const _BaseApp(),
    );
  }
}

class _BaseApp extends StatefulWidget {
  const _BaseApp();

  @override
  State<_BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<_BaseApp> {
  bool _isInitialized = false;
  final _navigationKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigationKey.currentState;

  @override
  void initState() {
    super.initState();

    setup();
  }

  Future<void> setup() async {
    final configRepository = context.read<ConfigRepository>();

    await configRepository.initialize();

    setState(() {
      _isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigationKey,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          filled: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(minimumSize: const Size(32, 56)),
        ),
      ),
      builder: _isInitialized
          ? (context, child) => BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  switch (state.status) {
                    case AuthStatus.unknown:
                      _navigator?.pushAndRemoveUntil(
                        SplashPage.route(),
                        (route) => false,
                      );
                      break;
                    case AuthStatus.authenticated:
                      _navigator?.pushAndRemoveUntil(
                        HomePage.route(),
                        (route) => false,
                      );
                      break;

                    case AuthStatus.unauthenticated:
                      _navigator?.pushAndRemoveUntil(
                        SignInPage.route(),
                        (route) => false,
                      );
                      break;
                  }
                },
                child: child,
              )
          : null,
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
