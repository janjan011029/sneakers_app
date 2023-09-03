import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/router/route_utils.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Account Page'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                child: Text('Show Details using go'),
                onPressed: () {
                  context.go('${AppPage.accountDetails.path}/0001');
                },
              ),
              SizedBox(height: 20),
              TextButton(
                child: Text('Show Details using push'),
                onPressed: () {
                  context.push('${AppPage.accountDetails.path}/002');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
