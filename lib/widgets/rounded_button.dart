import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget title;
  final Color color;
  const RoundedButton({
    Key? key,
    this.onPressed,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.only(top: 2, left: 1),
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.black45 : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: onPressed,
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: title,
        ),
      ),
    );
  }
}
