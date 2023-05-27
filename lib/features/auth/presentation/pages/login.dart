import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../widgets/rounded_button.dart';
import '../../../../widgets/text_form_field_label.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isView = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/nike.png'),
                fit: BoxFit.fitHeight,
              )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
              child: Column(
                children: [
                  // const Label(title: 'Email Address'),
                  const TextFormFieldLabel(
                    labelTitle: 'Username',
                    hintText: 'Username...',
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldLabel(
                    hintText: 'Enter password...',
                    labelTitle: 'Password',
                    isObscure: !isView,
                    isPassword: true,
                    onTap: () {
                      setState(() {
                        isView = !isView;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Container(
                padding: const EdgeInsets.only(top: 5, left: 1),
                child: RoundedButton(
                  color: Colors.black,
                  title: 'Login',
                  onPressed: () {
                    context.go('/dashboard');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
