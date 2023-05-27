import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String assetName;
  final String title;
  final bool isFavorite;
  final VoidCallback onTap;
  const CategoryCard({
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
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(assetName),
                fit: BoxFit.contain,
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
            width: 150,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  height: 45,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15)),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      // const Icon(Icons.add_box_rounded, color: Colors.white),
                      Container(
                        width: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15)),
                          color: Colors.transparent,
                        ),
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         child: Text(
          //           'Nike Air Max Pulse',
          //           style: Theme.of(context).textTheme.labelLarge,
          //           maxLines: 2,
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 5),
          //         child: GestureDetector(
          //             onTap: () {},
          //             child: isFavorite
          //                 ? const Icon(
          //                     Icons.favorite,
          //                     color: Colors.pink,
          //                   )
          //                 : const Icon(Icons.favorite_border_outlined)),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
