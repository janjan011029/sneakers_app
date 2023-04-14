import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/api/client.dart';

import '../../../widgets/rounded_button.dart';
import '../../../widgets/text_form_field_label.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isView = false;
  final _api = DioClient();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50),
                height: 180,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/nike.png'),
                  fit: BoxFit.fitHeight,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      isObscure: isView,
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
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  padding: const EdgeInsets.only(top: 2, left: 1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: RoundedButton(
                    color: Colors.black,
                    title: 'Enter',
                    onPressed: () {
                      context.go('/dashboard');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
