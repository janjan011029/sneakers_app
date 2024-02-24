import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/features/shop/presentation/pages/item_details.dart';

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
                  context.push('/cart', extra: context.read<CartCubit>());
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
            if (state.favoriteItems.length == 0) {
              return const Center(
                child: Text('No items found.'),
              );
            }

            return ListView.builder(
              itemCount: state.favoriteItems.length,
              itemBuilder: (context, index) {
                final item = state.favoriteItems[index];
                final itemName = item.shoeName ?? '-';
                final price = item.retailPrice ?? 0;
                final img = item.thumbnail ?? '';
                final isFavorite = item.isFavorite ?? false;

                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.3,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          borderRadius: BorderRadius.circular(10),
                          onPressed: (context) =>
                              context.read<FavoriteCubit>().removeItem(item),
                          backgroundColor: Colors.black87,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Remove',
                        ),
                      ],
                    ),
                    child: ItemCard(
                      itemName: itemName,
                      price: price,
                      img: img,
                      isLike: isFavorite,
                      onClick: () {
                        context.pushNamed(
                          'Item-Details',
                          extra: ItemDetailsParams(
                            data: item,
                            cartCubit: context.read<CartCubit>(),
                          ),
                        );
                      },
                      addToFav: () =>
                          context.read<FavoriteCubit>().removeItem(item),
                      addToCart: () {
                        context.read<CartCubit>().addToCart(item);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
