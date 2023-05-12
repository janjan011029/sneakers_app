import 'package:flutter/material.dart';
import 'package:sneakers_app/features/account/presentation/pages/account_page.dart';

import '../../../Item/presentation/pages/items_page.dart';
import '../../../favorite/presentation/pages/favorite_page.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../widgets/bottom_nav_bar.dart';

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
    const AccountPage(),
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
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onItemTap,
        ),
      ),
    );
  }
}
