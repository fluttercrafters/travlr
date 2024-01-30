import 'package:data/repositories/repositories.dart';
import 'package:domain/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travlr/core/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final configRepository = ConfigRepositoryImpl();

  await configRepository.initialize();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ConfigRepository>.value(
          value: configRepository,
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(),
        ),
        RepositoryProvider<JournalRepository>(
          create: (context) => JournalRepositoryImpl(),
        ),
        RepositoryProvider<TripRepository>(
          create: (context) => TripRepositoryImpl(),
        ),
      ],
      child: const TravlrApp(),
    ),
  );
}
