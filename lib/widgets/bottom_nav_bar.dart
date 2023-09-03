import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black26,
      showUnselectedLabels: true,
      unselectedLabelStyle: const TextStyle(color: Colors.black),
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 0 ? Icons.home : Icons.home_outlined,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 1
                ? Icons.shopping_bag
                : Icons.shopping_bag_outlined,
          ),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 2 ? Icons.favorite : Icons.favorite_outline,
          ),
          label: 'Liked',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 3
                ? TablerIcons.user_circle
                : TablerIcons.user_circle,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
