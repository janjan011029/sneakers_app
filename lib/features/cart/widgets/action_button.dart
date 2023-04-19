import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Icon icon;
  final Color? color;
  const ActionButton({
    super.key,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: color ?? Colors.black,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: icon,
    );
  }
}
