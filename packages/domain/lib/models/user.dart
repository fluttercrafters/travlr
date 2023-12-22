import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uuid;
  final String firstname;
  final String lastnames;
  final String email;

  const User({
    required this.uuid,
    required this.firstname,
    required this.lastnames,
    required this.email,
  });

  String get displayName => '$firstname $lastnames';

  static const empty = User(
    uuid: '',
    firstname: '',
    lastnames: '',
    email: '',
  );

  @override
  List<Object?> get props => [
        uuid,
        firstname,
        lastnames,
        email,
      ];
}
