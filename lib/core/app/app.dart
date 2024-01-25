import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travlr/core/app/navigation.dart';
import 'package:travlr/features/auth/bloc/auth_bloc.dart';


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
      child: MaterialApp.router(
        routerConfig: appRouter,
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
      ),
    );
  }
}
