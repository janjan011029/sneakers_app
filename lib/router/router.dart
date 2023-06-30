import 'package:go_router/go_router.dart';
import 'package:sneakers_app/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:sneakers_app/features/cart/presentation/pages/cart_page.dart';
import 'package:sneakers_app/onboarding_page.dart';

import '../error_screen.dart';
import '../features/shop/presentation/pages/item_details.dart';
import '../features/dashboard/presentation/pages/dashboard.dart';

class MyRouter {
  late final GoRouter routes = GoRouter(
    errorBuilder: (context, state) => const ErrorScreen(),
    initialLocation: '/',
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
    ],
  );
}
