import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;
import 'package:sneakers_app/features/cart/presentation/cubits/cart_cubit.dart';

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
    bool isShow =
        context.watch<CartCubit>().state.cartItems.isEmpty ? false : true;
    String bagdeCount =
        context.watch<CartCubit>().state.cartItems.length.toString();
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
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _renderHeader(),
          const SizedBox(height: 15),
          const DrawerIconText(
            icon: TablerIcons.home,
            title: 'Home',
          ),
          const DrawerIconText(
            icon: TablerIcons.settings,
            title: 'Settings',
          ),
          const DrawerIconText(
            icon: TablerIcons.shopping_cart,
            title: 'Cart',
          ),
          const DrawerIconText(
            icon: TablerIcons.user,
            title: 'Account',
          ),
          const DrawerIconText(
            icon: TablerIcons.bell,
            title: 'Notifications',
          ),
        ],
      ),
    );
  }

  Container _renderHeader() {
    return Container(
      color: Colors.black87,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage('assets/me.jpg'))),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Jaime Jr. Aballe',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const Text(
            'jaimeaballe@gmail.com',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerIconText extends StatelessWidget {
  const DrawerIconText({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 28,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
