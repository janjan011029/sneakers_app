import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_app/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:sneakers_app/features/cart/repositories/stripe_repository.dart';
import 'package:sneakers_app/features/favorite/presentation/cubits/favorite_cubit.dart';

import '../../../../widgets/bottom_nav_bar.dart';
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
  final favoriteCubit = FavoriteCubit();
  final cartCubit = CartCubit(StripeRepository());

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBarCubit(),
        ),
        BlocProvider(
          create: (context) => favoriteCubit,
        ),
        BlocProvider(
          create: (context) => cartCubit,
        ),
      ],
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
              bottomNavigationBar: MyBottomNavBar(
                currentIndex: bottomNavBarState,
                onTap: (val) => _onItemTap(val),
              ),
            ),
          );
        },
      ),
    );
  }
}
