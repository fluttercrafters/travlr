import 'package:domain/models/user.dart';

abstract class AuthRepository {

  Stream<User> get user;
  Future<void> login(String email, String password);
  Future<void> logout();
  Future<void> close();
}