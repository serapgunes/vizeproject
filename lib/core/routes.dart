import 'package:go_router/go_router.dart';

import '../screens/buy.dart';
import '../screens/core/error.dart';
import '../screens/core/loader.dart';
import '../screens/giris.dart';
import '../screens/homepage.dart';


final routes = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoaderScreen(),
    ),
    GoRoute(
      path: '/homepage',
      builder: (context, state) => const homepage(),
    ),
    GoRoute(
      path: '/giris',
      builder: (context, state) => const giris(),
    ),
    GoRoute(
      path: '/buy',
      builder: (context, state) => const buy(),
    ),
  ],
);
