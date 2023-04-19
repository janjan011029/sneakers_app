import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../cart/widgets/cart_item.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Shopping'),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(15.0),
              //         ),
              //         filled: true,
              //         hintStyle: TextStyle(color: Colors.grey[800]),
              //         hintText: "Search Item",
              //         fillColor: Colors.white70),
              //   ),
              // ),
              CartItem(
                isShop: true,
                onClick: () {
                  context.push('/item_details/Nike Air Max Pulse');
                },
              ),
              CartItem(
                isShop: true,
                onClick: () {
                  context.push('/item_details/Nike Air Max Pulse');
                },
              ),
              CartItem(
                isShop: true,
                onClick: () {
                  context.push('/item_details/Nike Air Max Pulse');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
