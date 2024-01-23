import 'dart:async';

import 'package:domain/models/user.dart';
import 'package:domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._authRepository,
  ) : super(const AuthState.unknown()) {
    on<AuthCredentialsUpdated>((event, emit) async {
      if (event.user == User.empty) {
        emit(const AuthState.unauthenticated());
        return;
      }

      emit(AuthState.authenticated(user: event.user));
    });
    on<AuthLogoutRequested>(_onLogoutRequested);

    _authRepository.user.listen((user) {
      add(AuthCredentialsUpdated(user: user));
    });
  }

  final AuthRepository _authRepository;

  FutureOr<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter emit,
  ) async {
    _authRepository.logout();
  }

  @override
  Future<void> close() {
    _authRepository.close();
    return super.close();
  }
}
