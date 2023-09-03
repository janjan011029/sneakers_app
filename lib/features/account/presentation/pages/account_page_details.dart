import 'package:flutter/material.dart';

class AccountPageDetails extends StatelessWidget {
  final String name;
  const AccountPageDetails({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(name),
          elevation: 0,
        ),
      ),
    );
  }
}
