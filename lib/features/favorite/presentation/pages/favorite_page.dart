import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../cart/presentation/cubits/cart_cubit.dart';
import '../../../shop/presentation/widgets/item_card.dart';
import '../cubits/favorite_cubit.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    super.key,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    context.read<FavoriteCubit>().initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isShow =
        context.watch<CartCubit>().state.cartItems.isEmpty ? false : true;
    String bagdeCount =
        context.watch<CartCubit>().state.cartItems.length.toString();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Favorite'),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 15),
              child: GestureDetector(
                onTap: () {
                  context.push('/cart');
                },
                child: badges.Badge(
                    showBadge: isShow,
                    badgeContent: Text(
                      bagdeCount,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: const Icon(Icons.shopping_cart_outlined)),
              ),
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
                final isFavorite = item.isFavorite ?? false;

                if (state.favoriteItems.isEmpty) {
                  return const Center(
                    child: Text('No items found.'),
                  );
                }

                return ItemCard(
                  itemName: itemName,
                  price: price,
                  img: img,
                  isLike: isFavorite,
                  onClick: () {
                    context.pushNamed(
                      'Item-Details',
                      extra: item,
                    );
                  },
                  addToFav: () =>
                      context.read<FavoriteCubit>().removeItem(item),
                  addToCart: () {
                    context.read<CartCubit>().addToCart(item);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
