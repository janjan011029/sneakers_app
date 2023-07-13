part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthUserChanged extends AuthEvent {
  AuthUserChanged({
    required this.authUser,
    this.user,
  });

  final auth.User? authUser;
  final User? user;
  @override
  List<Object?> get props => [
        authUser,
        user,
      ];
}

class LoginWithEmailAndPassword extends AuthEvent {
  LoginWithEmailAndPassword({
    required this.username,
    required this.password,
  });
  final String username;
  final String password;

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
