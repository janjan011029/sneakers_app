import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:sneakers_app/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51MqzRIEZvWPAlCUvnq7P8WVHYNqTL5QtmIXeMebQKcEKUl8c5ZMi9U7ZQOXMQUBjvSEY16NKcE1iLpTuvOm98Kku00CKvFp6JR';
  runApp(const MyApp());
}

final _myRouter = MyRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _myRouter.routes,
    );
  }
}
