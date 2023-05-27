import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../cart/widgets/cart_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Favorite'),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                  onTap: () {
                    context.push('/cart');
                  },
                  child: const Icon(Icons.shopping_cart_outlined)),
            ),
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              // CartItem(
              //   itemName: '',
              //   price: 99.00,
              //   img: '',
              //   isLike: true,
              //   isShop: true,
              //   onClick: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
