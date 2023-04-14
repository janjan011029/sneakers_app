import 'package:flutter/material.dart';
import 'package:sneakers_app/router/router.dart';

void main() {
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
