import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:domain/models/user.dart';
import 'package:domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl() {
    // Un StreamController que refresca los datos cada vez que alguien lo escucha.
    // Otra solución (posiblemente mejor) es usa RxDart -> BehaviorSubject.
    _userController = StreamController.broadcast(
      onListen: () => _refreshAuthStatus(),
    );

    _authSuscription = Amplify.Hub.listen(HubChannel.Auth, _onAuthEvent);
  }

  late StreamSubscription<AuthHubEvent> _authSuscription;

  late final StreamController<User> _userController;

  void _onAuthEvent(AuthHubEvent event) {
    switch (event.type) {
      case AuthHubEventType.signedIn:
        {
          _authenticated();
        }
      case AuthHubEventType.signedOut:
      case AuthHubEventType.sessionExpired:
      case AuthHubEventType.userDeleted:
        {
          _unauthenticated();
        }
    }
  }

  @override
  Stream<User> get user => _userController.stream;

  @override
  Future<void> login(String email, String password) async {
    try {
      await Amplify.Auth.signOut();

      await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
    } catch (e) {
      safePrint(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await Amplify.Auth.signOut();
    } catch (e) {
      safePrint(e);
    }
  }

  @override
  Future<void> close() async {
    _userController.close();
    _authSuscription.cancel();
  }

  Future<void> _refreshAuthStatus() async {
    final session = await Amplify.Auth.fetchAuthSession();
    if (session.isSignedIn) {
      _authenticated();
    } else {
      _unauthenticated();
    }
  }

  Future<void> _unauthenticated() async {
    _userController.add(User.empty);
  }

  Future<void> _authenticated() async {
    final attributes = await Amplify.Auth.fetchUserAttributes();

    final sub = attributes
        .firstWhere(
            (element) => element.userAttributeKey == AuthUserAttributeKey.sub)
        .value;

    final email = attributes
        .firstWhere(
            (element) => element.userAttributeKey == AuthUserAttributeKey.email)
        .value;

    final givenName = attributes
        .firstWhere((element) =>
            element.userAttributeKey == AuthUserAttributeKey.givenName)
        .value;

    final familyName = attributes
        .firstWhere((element) =>
            element.userAttributeKey == AuthUserAttributeKey.familyName)
        .value;

    final session = await Amplify.Auth.getPlugin(
      AmplifyAuthCognito.pluginKey,
    ).fetchAuthSession();

    try {
      final token = session.userPoolTokensResult.value.idToken.toJson();

      // Configura GraphQL con el token.
      // Configura Interceptor para API con el token. (Dio-http_interceptor-chopper)
      // Guarda token en local storage (encriptado idealmente)
      safePrint(token);

      _userController.add(
        User(
          uuid: sub,
          email: email,
          firstname: givenName,
          lastnames: familyName,
        ),
      );
    } catch (e) {
      safePrint(e);
    }
  }
}
