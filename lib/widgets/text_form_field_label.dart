import 'package:flutter/material.dart';

class TextFormFieldLabel extends StatelessWidget {
  final String hintText;
  final String labelTitle;
  final bool isObscure;
  final bool numberOnly;
  final VoidCallback? onTap;
  final bool isPassword;
  const TextFormFieldLabel({
    Key? key,
    this.isObscure = false,
    this.numberOnly = false,
    required this.hintText,
    required this.labelTitle,
    this.onTap,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3, bottom: 2),
          child: Text(
            labelTitle,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        TextFormField(
          keyboardType: numberOnly ? TextInputType.number : TextInputType.text,
          decoration: isPassword
              ? InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  hintText: hintText,
                  fillColor: Colors.white70,
                  suffixIcon: InkWell(
                      onTap: onTap,
                      child: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility)),
                )
              : InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  hintText: hintText,
                  fillColor: Colors.white70,
                ),
          obscureText: isObscure,
        ),
      ],
    );
  }
}
