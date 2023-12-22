import 'package:flutter/material.dart';
import 'package:travlr/features/auth/auth.dart';

class TravlrApp extends StatelessWidget {
  const TravlrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(32, 56)
            ),
          ),
        ),
        home: const SignInPage());
  }
}
