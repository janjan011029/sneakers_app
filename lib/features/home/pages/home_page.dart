import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/widgets/shoe_card.dart';

import '../../../widgets/promo_card.dart';

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
            'Nike Clone',
            style: TextStyle(fontFamily: 'Raleway'),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CarouselSlider(
              //   items: const [
              //     PromoCard(),
              //   ],
              //   options: CarouselOptions(
              //     height: 150,
              //     padEnds: false,
              //     pageSnapping: false,
              //     viewportFraction: 1,
              //   ),
              // ),
              const PromoCard(),
              const SizedBox(height: 10),

              const Text(
                'NEW ARRIVALS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Center(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      Hero(
                        tag: 'sample',
                        child: ShoeCard(
                          assetName: 'assets/air_max.png',
                          title: '\$99.00',
                          onTap: () {
                            context.push('/item_details/Nike Air Max Pulse');
                          },
                        ),
                      ),
                      ShoeCard(
                        assetName: 'assets/air_max.png',
                        title: '\$99.00',
                        onTap: () {},
                      ),
                      ShoeCard(
                        assetName: 'assets/air_max.png',
                        title: '\$99.00',
                        onTap: () {},
                      ),
                      ShoeCard(
                        assetName: 'assets/air_max.png',
                        title: '\$99.00',
                        onTap: () {},
                      ),
                      ShoeCard(
                        assetName: 'assets/air_max.png',
                        title: '\$99.00',
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
