import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../api/client.dart';
import '../../../../utils/constant/app_enums.dart';
import '../../../../widgets/app_loading_shimmer.dart';
import '../../../cart/presentation/cubits/cart_cubit.dart';
import '../widgets/item_card.dart';
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
    bool isShow =
        context.watch<CartCubit>().state.cartItems.isEmpty ? false : true;
    String bagdeCount =
        context.watch<CartCubit>().state.cartItems.length.toString();
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

                        return ItemCard(
                          isLike: isFavorite,
                          img: image,
                          itemName: shoeName,
                          price: price,
                          onClick: () {
                            context.pushNamed(
                              'Item-Details',
                              extra: shoes,
                            );
                          },
                          addToCart: () {
                            context.read<CartCubit>().addToCart(shoes);

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(_snackbar(shoeName));
                          },
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

  SnackBar _snackbar(String shoeName) {
    return SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      showCloseIcon: false,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        color: Colors.green,
        title: 'Successfully Added!',
        message: '$shoeName is now added to cart',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
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
