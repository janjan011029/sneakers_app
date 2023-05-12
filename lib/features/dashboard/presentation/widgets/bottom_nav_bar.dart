import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required int currentIndex,
    required this.onTap,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      onTap: (a) {},
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
              ? Icons.manage_accounts
              : Icons.manage_accounts_outlined),
          label: 'Account',
        ),
      ],
    );
  }
}
