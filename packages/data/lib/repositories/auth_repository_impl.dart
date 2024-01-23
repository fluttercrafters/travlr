import 'dart:async';

import 'package:domain/models/user.dart';
import 'package:domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl() {
    _refreshAuthStatus();
  }

  final StreamController<User> _userController = StreamController.broadcast();

  @override
  Stream<User> get user => _userController.stream;

  @override
  Future<void> login(String email, String password) async {
    // validamos el email y password.
    // ir a traer informacion a BD local o remota.

    await Future.delayed(const Duration(seconds: 2), () {
      _userController.add(User(
        uuid: 'some-uuid',
        email: email,
        firstname: 'John',
        lastnames: 'Doe',
      ));
    });
  }

  @override
  Future<void> logout() async {
    _userController.add(User.empty);
  }

  @override
  Future<void> close() async {
    _userController.close();
  }

  Future<void> _refreshAuthStatus() async {
    Future.delayed(const Duration(seconds: 3), () {
      _userController.add(User.empty);
    });
  }
}
