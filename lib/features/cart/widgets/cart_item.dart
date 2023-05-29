import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_app/features/cart/widgets/action_button.dart';
import 'package:sneakers_app/features/cart/widgets/rounded_cart_button.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    this.isShop = false,
    this.isLike = false,
    required this.itemName,
    required this.price,
    required this.img,
    required this.onClick,
    required this.addToFav,
    required this.addToCart,
  });

  final bool isShop;
  final bool isLike;
  final String itemName;
  final double price;
  final String img;
  final VoidCallback onClick;
  final VoidCallback addToFav;
  final VoidCallback addToCart;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final x = Random();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
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
            _renderDetails(3),
          ],
        ),
      ),
    );
  }

  Expanded _renderDetails(int star) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: widget.onClick,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    widget.itemName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      for (var x = 0; x <= star; x++)
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                    ],
                  ),
                  Text(
                    '\$${widget.price}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            widget.isShop
                ? RoundedCartButton(
                    isLiked: widget.isLike,
                    onClick: widget.addToCart,
                    onLike: widget.addToFav,
                  )
                : _renderAction(),
          ],
        ),
      ),
    );
  }

  Row _renderAction() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
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

  InkWell _renderImage() {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 140,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: widget.img,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
