import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/features/cart/widgets/cart_item.dart';
import 'package:sneakers_app/features/favorite/presentation/cubits/favorite_cubit.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    super.key,
  });

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
        body: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.favoriteItems.length,
              itemBuilder: (context, index) {
                final item = state.favoriteItems[index];
                final itemName = item.shoeName ?? '-';
                final price = item.retailPrice?.toDouble() ?? 0.0;
                final img = item.thumbnail ?? '';

                if (state.favoriteItems.isEmpty) {
                  return const Center(
                    child: Text('No items found.'),
                  );
                }

                return CartItem(
                  itemName: itemName,
                  price: price,
                  img: img,
                  onClick: () {},
                  addToFav: () {},
                  addToCart: () {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}
