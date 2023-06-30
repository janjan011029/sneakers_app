import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:sneakers_app/features/auth/repositories/auth_repository/auth_repository.dart';
import 'package:sneakers_app/features/auth/repositories/user_repository/user_repository.dart';
import 'package:sneakers_app/utils/constant/app_style.dart';

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
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AuthRepository(),
          ),
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>(),
                userRepository: context.read<UserRepository>(),
              ),
            ),
          ],
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 180,
                  width: 350,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/sneakers_app.png'),
                    fit: BoxFit.fitWidth,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 5, left: 1),
                    child: RoundedButton(
                      color: Colors.black,
                      title: const Text(
                        'Login',
                        style: AppStyle.defaultTitle,
                      ),
                      onPressed: () {
                        context.go('/dashboard');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 5, left: 1),
                    child: const RoundedButton(
                      color: Colors.black,
                      title: Text(
                        'Signup',
                        style: AppStyle.defaultTitle,
                      ),
                      // onPressed: () {
                      //   context.go('/signup');
                      // },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
