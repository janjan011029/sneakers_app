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
  final UserModel? user;
  @override
  List<Object?> get props => [
        authUser,
        user,
      ];
}
