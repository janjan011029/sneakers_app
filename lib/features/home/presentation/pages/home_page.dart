import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../api/client.dart';
import '../../../../utils/constant/app_enums.dart';
import '../../../../widgets/app_home_loading_shimmer.dart';
import '../../../../widgets/category.dart';
import '../../../../widgets/promo_card.dart';
import '../../../shop/presentation/blocs/shop_bloc.dart';
import '../../../shop/repositories/shop_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dioClient = DioClient();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopBloc(ShopRepository(
        dioClient: _dioClient,
      ))
        ..add(GetPopularShoes()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: const NavigationDrawer(),
          appBar: AppBar(
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
            centerTitle: true,
            backgroundColor: Colors.black,
            title: const Text(
              'Sneakers App',
              style: TextStyle(fontFamily: 'Raleway'),
            ),
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PromoCard(),
                const SizedBox(height: 10),
                _renderCategory(),
                const SizedBox(height: 10),
                Expanded(
                  child: BlocBuilder<ShopBloc, ShopState>(
                    builder: (context, state) {
                      final status = state.getPopularShoesStatus;
                      if (status == Status.success) {
                        return Center(
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            children: [
                              for (var x in state.popularShoes) ...{
                                CategoryCard(
                                  assetName: x.thumbnail ?? '',
                                  title: x.silhoutte ?? '-',
                                  onTap: () {},
                                ),
                              }
                            ],
                          ),
                        );
                      }

                      if (status == Status.failure) {
                        return const Center(
                          child: Text('No data found.'),
                        );
                      }

                      return const AppHomeLoadingShimmer();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _renderCategory() {
    return const Text(
      'POPULAR PRODUCTS',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Colors.white,
    );
  }
}
