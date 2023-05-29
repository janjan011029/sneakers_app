import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/features/favorite/presentation/cubits/favorite_cubit.dart';

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
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                    onTap: () {
                      context.push('/cart');
                    },
                    child: const Icon(Icons.shopping_cart_outlined)),
              ),
            ],
          ),
          body: BlocConsumer<FavoriteCubit, FavoriteState>(
            listenWhen: (p, c) => p != c,
            listener: (context, state) {
              if (state.alreadyExist) {
                final snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'On Snap!',
                    message:
                        'This is an example error message that will be shown in the body of snackbar!',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.failure,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);

                context.read<FavoriteCubit>().setAlreadyExistToFalse();
              }
            },
            builder: (context, favState) {
              return BlocBuilder<ShopBloc, ShopState>(
                builder: (context, state) {
                  final status = state.getShoesStatus;
                  if (status == Status.success) {
                    return ListView.builder(
                      itemCount: state.shoes.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          img: state.shoes[index].thumbnail ?? '-',
                          itemName: state.shoes[index].shoeName ?? '-',
                          price:
                              state.shoes[index].retailPrice?.toDouble() ?? 0.0,
                          isShop: true,
                          onClick: () {
                            context.push(
                                '/item_details///${state.shoes[index].thumbnail}');
                          },
                          addToCart: () {},
                          addToFav: () {
                            context
                                .read<FavoriteCubit>()
                                .addToFavorite(state.shoes[index]);
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
