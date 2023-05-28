import 'package:flutter/material.dart';

class RoundedCartButton extends StatelessWidget {
  const RoundedCartButton({
    super.key,
    required this.onClick,
    required this.onLike,
    this.isLiked = false,
  });

  final VoidCallback onClick;
  final VoidCallback onLike;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _renderFavorite(),
        const SizedBox(width: 5),
        _renderButton(),
      ],
    );
  }

  Expanded _renderButton() {
    return Expanded(
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
    );
  }

  InkWell _renderFavorite() {
    return InkWell(
      onTap: onLike,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border_outlined,
          color: isLiked ? Colors.pink : Colors.black,
        ),
      ),
    );
  }
}
