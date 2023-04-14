import 'package:flutter/material.dart';

class ShoeCard extends StatelessWidget {
  final String assetName;
  final String title;
  final bool isFavorite;
  final VoidCallback onTap;
  const ShoeCard({
    Key? key,
    required this.assetName,
    required this.title,
    required this.onTap,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: AssetImage(assetName),
                fit: BoxFit.fitHeight,
              ),
            ),
            width: 150,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15)),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        const Icon(Icons.add_box_rounded, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Nike Air Max Pulse',
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: GestureDetector(
                      onTap: () {},
                      child: isFavorite
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            )
                          : const Icon(Icons.favorite_border_outlined)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
