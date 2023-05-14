import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/features/dashboard/presentation/cubits/bottom_nav_bar_cubit.dart';
import 'package:sneakers_app/widgets/category.dart';

import '../../../../widgets/promo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                child: Center(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      CategoryCard(
                        assetName: 'assets/air_max.png',
                        title: 'JORDAN',
                        onTap: () {
                          context.read<BottomNavBarCubit>().selectPage(1);
                        },
                      ),
                      CategoryCard(
                        assetName: 'assets/basketball.png',
                        title: 'NIKE',
                        onTap: () {},
                      ),
                      CategoryCard(
                        assetName: 'assets/air_max.png',
                        title: 'ADIDAS',
                        onTap: () {},
                      ),
                      CategoryCard(
                        assetName: 'assets/basketball.png',
                        title: 'PUMA',
                        onTap: () {},
                      ),
                      CategoryCard(
                        assetName: 'assets/basketball.png',
                        title: 'FILA',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _renderCategory() {
    return const Text(
      'CATEGORY',
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
