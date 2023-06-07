import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.color,
  });

  final Icon icon;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      elevation: 2.0,
      fillColor: color ?? Colors.black,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: icon,
    );
  }
}
