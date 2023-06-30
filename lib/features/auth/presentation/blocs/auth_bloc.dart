import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_app/features/auth/repositories/auth_repository/auth_repository.dart';
import 'package:sneakers_app/features/auth/repositories/user_repository/user_repository.dart';

import '../../models/user_model.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  StreamSubscription<auth.User?>? authUserSubscription;
  StreamSubscription<UserModel?>? userSubscription;

  AuthBloc({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const AuthState()) {
    on<AuthUserChanged>(_authUserChanged);

    authUserSubscription = _authRepository.user.listen((authUser) {
      print('Auth User: $authUser');
      if (authUser != null) {
        _userRepository.getUser(authUser.uid).listen((user) {
          add(AuthUserChanged(authUser: authUser, user: user));
        });
      } else {
        add(AuthUserChanged(authUser: authUser));
      }
    });
  }

  FutureOr<void> _authUserChanged(
      AuthUserChanged event, Emitter<AuthState> emit) async {
    if (event.authUser != null) {
      emit(state.copyWith(
        authStatus: AuthStatus.authenticated,
        authUser: event.authUser,
        user: event.user,
      ));
    } else {
      emit(state.copyWith(
        authStatus: AuthStatus.unauthenticated,
      ));
    }
  }

  @override
  Future<void> close() {
    authUserSubscription?.cancel();
    userSubscription?.cancel();
    return super.close();
  }
}
