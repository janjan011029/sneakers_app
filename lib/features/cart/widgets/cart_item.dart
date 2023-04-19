import 'package:flutter/material.dart';
import 'package:sneakers_app/features/cart/widgets/action_button.dart';
import 'package:sneakers_app/features/cart/widgets/rounded_cart_button.dart';

class CartItem extends StatelessWidget {
  final bool isShop;
  final bool isLike;
  final VoidCallback onClick;
  const CartItem({
    super.key,
    this.isShop = false,
    this.isLike = false,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onClick,
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              _renderImage(),
              _renderDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _renderDetails() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  maxLines: 2,
                  'Nike Air Max Pulse',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    for (var x = 0; x <= 3; x++)
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                  ],
                ),
                const Text(
                  '\$99',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            isShop
                ? RoundedCartButton(
                    isLiked: isLike,
                    onClick: () {},
                  )
                : _renderAction(),
          ],
        ),
      ),
    );
  }

  Row _renderAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        ActionButton(
          icon: Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        Text(
          '1',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        ActionButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Container _renderImage() {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        image: const DecorationImage(
          image: AssetImage('assets/air_max.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
