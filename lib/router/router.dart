import 'package:go_router/go_router.dart';
import 'package:sneakers_app/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:sneakers_app/features/cart/presentation/pages/cart_page.dart';
import 'package:sneakers_app/models/shoe_api_result.dart';
import 'package:sneakers_app/onboarding_page.dart';

import '../error_screen.dart';
import '../features/shop/presentation/pages/item_details.dart';
import '../features/auth/presentation/blocs/auth_state.dart';
import '../features/dashboard/presentation/pages/dashboard.dart';

class MyRouter {
  final provider = AuthStateProvider();

  late final GoRouter routes = GoRouter(
    errorBuilder: (context, state) => const ErrorScreen(),
    initialLocation: provider.isLoggedIn ? '/dashboard' : '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const OnBoardingPage();
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
          return ItemDetails(data: state.extra as ShoeApiResult);
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
    ],
  );
}
