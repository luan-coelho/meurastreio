import 'package:go_router/go_router.dart';
import 'package:meurastreio/screens/login_screen.dart';
import 'package:meurastreio/screens/orders/list_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/orders',
      builder: (context, state) => const ListOrdersScreen(),
    ),
  ],
);
