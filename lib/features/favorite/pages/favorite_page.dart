import 'package:flutter/material.dart';

import '../../../widgets/shoe_card.dart';

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
          title: const Text('Favorite Shoe\'s'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              for (var x = 0; x <= 10; x++)
                ShoeCard(
                  assetName: 'assets/air_max.png',
                  title: '\$99.00',
                  isFavorite: true,
                  onTap: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}
