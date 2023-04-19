import 'package:flutter/material.dart';

class RoundedCartButton extends StatelessWidget {
  final VoidCallback onClick;
  final bool isLiked;
  const RoundedCartButton({
    super.key,
    required this.onClick,
    this.isLiked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border_outlined,
            color: isLiked ? Colors.pink : Colors.black,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            onPressed: onClick,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
