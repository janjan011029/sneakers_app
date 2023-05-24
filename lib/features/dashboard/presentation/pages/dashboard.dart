import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../../shop/presentation/pages/items_page.dart';
import '../../../account/presentation/pages/account_page.dart';
import '../../../favorite/presentation/pages/favorite_page.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../cubits/bottom_nav_bar_cubit.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _pageController = PageController();

  final List<Widget> _screen = [
    const HomePage(),
    const ItemsPage(),
    const FavoritePage(),
    const AccountPage(),
  ];

  void _onItemTap(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocConsumer<BottomNavBarCubit, int>(
        listenWhen: (p, c) => p != c,
        listener: (context, bottomNavBarState) {
          _onItemTap(bottomNavBarState);
        },
        builder: (context, bottomNavBarState) {
          return SafeArea(
            child: Scaffold(
              body: PageView(
                controller: _pageController,
                onPageChanged: (index) =>
                    context.read<BottomNavBarCubit>().selectPage(index),
                physics: const NeverScrollableScrollPhysics(),
                children: _screen,
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: bottomNavBarState,
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
                    icon: Icon(
                      bottomNavBarState == 0 ? Icons.home : Icons.home_outlined,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      bottomNavBarState == 1
                          ? Icons.shopping_bag
                          : Icons.shopping_bag_outlined,
                    ),
                    label: 'Shop',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      bottomNavBarState == 2
                          ? Icons.favorite
                          : Icons.favorite_outline,
                    ),
                    label: 'Liked',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      bottomNavBarState == 3
                          ? TablerIcons.user_circle
                          : TablerIcons.user_circle,
                    ),
                    label: 'Account',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
