import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_app/router/router.dart';

import 'features/auth/presentation/blocs/auth_bloc.dart';
import 'features/auth/repositories/auth_repository/auth_repository.dart';
import 'features/auth/repositories/user_repository/user_repository.dart';

final _myRouter = MyRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        authRepository: AuthRepository(),
        userRepository: UserRepository(),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _myRouter.routes,
      ),
    );
  }
}
