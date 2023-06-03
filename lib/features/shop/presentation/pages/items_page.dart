import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../api/client.dart';
import '../../../../utils/constant/app_enums.dart';
import '../../../../widgets/app_loading_shimmer.dart';
import '../../../cart/widgets/cart_item.dart';
import '../../repositories/shop_repository.dart';
import '../blocs/shop_bloc.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final _dioClient = DioClient();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopBloc>(
          create: (context) => ShopBloc(ShopRepository(
            dioClient: _dioClient,
          ))
            ..add(GetShoes()),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text('Shopping'),
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 15),
                child: GestureDetector(
                  onTap: () {
                    context.push('/cart');
                  },
                  child: const badges.Badge(
                      badgeContent: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: Icon(Icons.shopping_cart_outlined)),
                ),
              ),
            ],
          ),
          body: BlocConsumer<ShopBloc, ShopState>(
            listener: (context, state) {
              context.read<ShopBloc>().add(SetEmittedToFalse());
            },
            builder: (context, state) {
              return BlocBuilder<ShopBloc, ShopState>(
                builder: (context, state) {
                  final status = state.getShoesStatus;
                  if (status == Status.success) {
                    return ListView.builder(
                      itemCount: state.shoes.length,
                      itemBuilder: (context, index) {
                        final shoes = state.shoes[index];
                        final isFavorite = shoes.isFavorite ?? false;
                        final image = shoes.thumbnail ?? '';
                        final shoeName = shoes.shoeName ?? '-';
                        final price = shoes.retailPrice?.toDouble() ?? 0.0;
                        final productId = shoes.goatProductId ?? 0;

                        return CartItem(
                          isLike: isFavorite,
                          img: image,
                          itemName: shoeName,
                          price: price,
                          isShop: true,
                          onClick: () {
                            context.pushNamed(
                              'Item-Details',
                              extra: shoes,
                            );
                          },
                          addToCart: () {},
                          addToFav: () {
                            context.read<ShopBloc>().add(AddToFavorites(
                                  isAdd: !isFavorite,
                                  id: productId,
                                ));
                            if (!isFavorite) {
                              context
                                  .read<FavoriteCubit>()
                                  .addToFavorite(shoes);
                            } else {
                              context.read<FavoriteCubit>().removeItem(shoes);
                            }
                          },
                        );
                      },
                    );
                  }

                  if (status == Status.failure) {
                    return const Center(
                      child: Text('No Data found'),
                    );
                  }
                  return const AppLoadingShimmer();
                },
              );
            },
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _renderBody() {
    return const SingleChildScrollView(
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
          // CartItem(
          //   isShop: true,
          //   onClick: () {
          //     context.push('/item_details/Nike Air Max Pulse');
          //   },
          // ),
          // CartItem(
          //   isShop: true,
          //   onClick: () {
          //     context.push('/item_details/Nike Air Max Pulse');
          //   },
          // ),
          // CartItem(
          //   isShop: true,
          //   onClick: () {
          //     context.push('/item_details/Nike Air Max Pulse');
          //   },
          // ),
        ],
      ),
    );
  }

  _renderItems() {
    // List
  }
}
