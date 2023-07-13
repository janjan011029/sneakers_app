import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:sneakers_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:sneakers_app/features/auth/repositories/auth_repository/auth_repository.dart';
import 'package:sneakers_app/features/auth/repositories/user_repository/user_repository.dart';
import 'package:sneakers_app/router/router.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Stripe.publishableKey =
      'pk_test_51MqzRIEZvWPAlCUvnq7P8WVHYNqTL5QtmIXeMebQKcEKUl8c5ZMi9U7ZQOXMQUBjvSEY16NKcE1iLpTuvOm98Kku00CKvFp6JR';
  runApp(const MyApp());
}

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
