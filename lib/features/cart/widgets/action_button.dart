import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Icon icon;
  const ActionButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.grey[200],
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: icon,
    );
  }
}
