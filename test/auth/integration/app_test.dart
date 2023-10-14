import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sneakers_app/main.dart' as app;

void main() {
  group('App Automation Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("Login test", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final usernameTextField = find.byKey(const Key('UsernameKey'));
      final passwordTextField = find.byKey(const Key('PasswordKey'));

      final loginButton = find.byKey(const Key('LoginButtonKey'));

      //Enter an empty credentials
      await tester.enterText(usernameTextField, '');
      await tester.enterText(passwordTextField, '');
      await tester.pumpAndSettle();

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // // Find the error message widget and verify its content
      // final errorMessageFinder = find.text('Username is required!');
      // expect(errorMessageFinder, findsOneWidget);

      // //Enter a wrong credentials
      // await tester.enterText(usernameTextField, 'wrong@gmail.com');
      // await tester.enterText(passwordTextField, 'password');
      // await tester.pumpAndSettle();

      // await tester.tap(loginButton);
      // await tester.pumpAndSettle();
    });
  });
}
