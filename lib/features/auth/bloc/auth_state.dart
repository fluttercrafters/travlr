part of 'auth_bloc.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

final class AuthState extends Equatable {
  const AuthState.unknown({
    this.user = User.empty,
    this.status = AuthStatus.unknown,
  });

  const AuthState.authenticated({required this.user})
      : status = AuthStatus.authenticated;

  const AuthState.unauthenticated()
      : user = User.empty,
        status = AuthStatus.unauthenticated;

  final User user;
  final AuthStatus status;

  @override
  List<Object?> get props => [
        user,
        status,
      ];
}
