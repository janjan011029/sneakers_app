part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  const AuthState({
    this.authStatus = AuthStatus.unknown,
    this.authUser,
    this.user,
  });

  final AuthStatus authStatus;
  final auth.User? authUser;
  final UserModel? user;

  AuthState copyWith({
    AuthStatus? authStatus,
    auth.User? authUser,
    UserModel? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      authUser: authUser ?? this.authUser,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        authStatus,
        authUser,
        user,
      ];
}
