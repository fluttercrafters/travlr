part of 'auth_bloc.dart';

// Event Naming Convention:
// BlocSubject + Noun (optional) + Verb (event)

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthCredentialsUpdated extends AuthEvent {
  final User user;

  const AuthCredentialsUpdated({
    required this.user,
  });

  @override
  List<Object> get props => [
        user,
      ];
}

final class AuthSocialLoginAttempted extends AuthEvent {
  final String provider;

  const AuthSocialLoginAttempted({
    required this.provider,
  });

  @override
  List<Object> get props => [provider];
}

final class AuthLogoutRequested extends AuthEvent {}
