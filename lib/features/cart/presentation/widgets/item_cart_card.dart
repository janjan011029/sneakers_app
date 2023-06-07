import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../cart/widgets/action_button.dart';

class ItemCartCard extends StatefulWidget {
  const ItemCartCard({
    super.key,
    this.isLike = false,
    required this.itemName,
    this.qty = 0,
    required this.price,
    required this.img,
    required this.addQty,
    required this.lessQty,
    required this.onDelete,
  });

  final bool isLike;
  final String itemName;
  final int qty;
  final double price;
  final String img;
  final VoidCallback addQty;
  final VoidCallback lessQty;
  final void Function(BuildContext) onDelete;

  @override
  State<ItemCartCard> createState() => _ItemCartCardState();
}

class _ItemCartCardState extends State<ItemCartCard> {
  final x = Random();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              onPressed: widget.onDelete,
              backgroundColor: Colors.black87,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Remove',
            ),
          ],
        ),
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
              _renderDetails(
                3,
                widget.qty,
                widget.addQty,
                widget.lessQty,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _renderDetails(
    int star,
    int qty,
    VoidCallback addQty,
    VoidCallback lessQty,
  ) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(
                  onTap: lessQty,
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
                  onTap: addQty,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Hero _renderImage() {
    return Hero(
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
    );
  }
}
