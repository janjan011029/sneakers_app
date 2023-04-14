import 'package:flutter/material.dart';

import '../../Item/pages/items_page.dart';
import '../../cart/pages/cart_page.dart';
import '../../favorite/pages/favorite_page.dart';
import '../../home/pages/home_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final _pageController = PageController();

  final List<Widget> _screen = [
    const HomePage(),
    const ItemsPage(),
    const FavoritePage(),
    const CartPage(),
  ];

  void _onPageChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTap(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChange,
          physics: const NeverScrollableScrollPhysics(),
          children: _screen,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black26,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: _onItemTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(_currentIndex == 1
                  ? Icons.shopping_bag
                  : Icons.shopping_bag_outlined),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _currentIndex == 2 ? Icons.favorite : Icons.favorite_outline),
              label: 'Liked',
            ),
            BottomNavigationBarItem(
              icon: Icon(_currentIndex == 3
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
