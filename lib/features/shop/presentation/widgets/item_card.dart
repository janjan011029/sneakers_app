import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../cart/widgets/action_button.dart';
import '../../../cart/widgets/rounded_cart_button.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    super.key,
    this.isLike = false,
    required this.itemName,
    this.qty = 0,
    required this.price,
    required this.img,
    required this.onClick,
    required this.addToFav,
    required this.addToCart,
  });

  final bool isLike;
  final String itemName;
  final int qty;
  final int price;
  final String img;
  final VoidCallback onClick;
  final VoidCallback addToFav;
  final VoidCallback addToCart;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  final x = Random();
  @override
  Widget build(BuildContext context) {
    return Container(
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
            RoundedCartButton(
              isLiked: widget.isLike,
              onClick: widget.addToCart,
              onLike: widget.addToFav,
            ),
          ],
        ),
      ),
    );
  }

  Row _renderAction(VoidCallback addQty, VoidCallback lessQty, int qty) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(
          onTap: addQty,
          icon: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        Text(
          '$qty',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        ActionButton(
          onTap: lessQty,
          icon: const Icon(
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
      child: Hero(
        tag: widget.img,
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
      ),
    );
  }
}
