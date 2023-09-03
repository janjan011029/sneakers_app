import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/widgets/bottom_nav_bar.dart';

import '../../../../router/route_utils.dart';
import '../../../cart/presentation/cubits/cart_cubit.dart';
import '../../../cart/repositories/stripe_repository.dart';
import '../../../favorite/presentation/cubits/favorite_cubit.dart';

class GoDashboard extends StatefulWidget {
  const GoDashboard({
    super.key,
    required this.dashboardChild,
  });

  final Widget dashboardChild;

  @override
  State<GoDashboard> createState() => _GoDashboardState();
}

class _GoDashboardState extends State<GoDashboard> {
  static int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).location;
    if (location.startsWith(AppPage.home.path)) {
      return 0;
    }
    if (location.startsWith(AppPage.items.path)) {
      return 1;
    }
    if (location.startsWith(AppPage.favorite.path)) {
      return 2;
    }
    if (location.startsWith(AppPage.account.path)) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(AppPage.home.path);
        break;
      case 1:
        context.go(AppPage.items.path);
        break;
      case 2:
        context.go(AppPage.favorite.path);
        break;
      case 3:
        context.go(AppPage.account.path);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = FavoriteCubit();
    final cartCubit = CartCubit(StripeRepository());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => favoriteCubit,
        ),
        BlocProvider(
          create: (context) => cartCubit,
        ),
      ],
      child: SafeArea(
          child: Scaffold(
        body: widget.dashboardChild,
        bottomNavigationBar: MyBottomNavBar(
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int idx) => _onItemTapped(idx, context),
        ),
      )),
    );
  }
}
