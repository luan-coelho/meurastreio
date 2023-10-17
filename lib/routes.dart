import 'package:go_router/go_router.dart';
import 'package:meurastreio/screens/login_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
