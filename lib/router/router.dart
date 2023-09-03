import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/features/account/presentation/pages/account_page_details.dart';
import 'package:sneakers_app/features/auth/presentation/pages/login.dart';
import 'package:sneakers_app/router/route_utils.dart';

import '../error_screen.dart';
import '../features/account/presentation/pages/account_page.dart';
import '../features/cart/presentation/cubits/cart_cubit.dart';
import '../features/cart/presentation/pages/cart_page.dart';
import '../features/dashboard/presentation/pages/dashboard.dart';
import '../features/dashboard/presentation/pages/go_dashboard.dart';
import '../features/favorite/presentation/pages/favorite_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/shop/presentation/pages/item_details.dart';
import '../features/shop/presentation/pages/items_page.dart';
import '../onboarding_page.dart';

class MyRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  //* Page builders
  Page<dynamic> _homePage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: HomePage());
  Page<dynamic> _itemsPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: ItemsPage());

  late final GoRouter routes = GoRouter(
    errorBuilder: (context, state) => const ErrorScreen(),
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppPage.login.path,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const OnBoardingPage();
        },
      ),
      GoRoute(
        path: AppPage.login.path,
        name: AppPage.login.name,
        builder: (context, state) {
          return const Login();
        },
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) {
          return const Dashboard();
        },
      ),
      GoRoute(
        path: '/item_details',
        name: 'Item-Details',
        builder: (context, state) {
          return ItemDetails(params: state.extra as ItemDetailsParams);
        },
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) {
          return CartPage(
            cartCubit: state.extra as CartCubit,
          );
        },
      ),
      _shellRoute(),
    ],
  );

  ShellRoute _shellRoute() {
    return ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return GoDashboard(dashboardChild: child);
      },
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: AppPage.home.path,
          name: AppPage.home.name,
          pageBuilder: _homePage,
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: AppPage.items.path,
          name: AppPage.items.name,
          pageBuilder: _itemsPage,
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: AppPage.favorite.path,
          name: AppPage.favorite.name,
          builder: (context, state) {
            return const FavoritePage();
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: AppPage.account.path,
          name: AppPage.account.name,
          builder: (context, state) {
            return const AccountPage();
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '${AppPage.accountDetails.path}/:name',
          name: AppPage.accountDetails.name,
          builder: (context, state) {
            return AccountPageDetails(
              name: state.params['name']!,
            );
          },
        ),
      ],
    );
  }
}
