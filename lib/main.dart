import 'package:data/repositories/auth_repository_impl.dart';
import 'package:data/repositories/config_repository_impl.dart';
import 'package:domain/repositories/auth_repository.dart';
import 'package:domain/repositories/config_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travlr/core/app/app.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(),
        ),
        RepositoryProvider<ConfigRepository>(
          create: (context) => ConfigRepositoryImpl(),
        ),
      ],
      child: const TravlrApp(),
    ),
  );
}
