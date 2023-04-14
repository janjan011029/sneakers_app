import 'package:go_router/go_router.dart';
import 'package:sneakers_app/features/cart/pages/cart_page.dart';

import '../error_screen.dart';
import '../features/Item/pages/item_details.dart';
import '../features/auth/pages/login.dart';
import '../features/auth/state/auth_state.dart';
import '../features/dashboard/pages/dashboard.dart';

class MyRouter {
  final provider = AuthStateProvider();

  late final GoRouter routes = GoRouter(
    errorBuilder: (context, state) => const ErrorScreen(),
    initialLocation: provider.isLoggedIn ? '/dashboard' : '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
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
        path: '/item_details/:id',
        builder: (context, state) {
          return ItemDetails(title: state.params['id']!);
        },
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) {
          return const CartPage();
        },
      ),
    ],
  );
}
