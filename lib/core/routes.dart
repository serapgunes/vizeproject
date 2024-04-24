import 'package:go_router/go_router.dart';
import 'package:vizeproje/screens/core/loader.dart';

import '../screens/buy.dart';
import '../screens/core/error.dart';
import '../screens/core/loader.dart';
import '../screens/giris.dart';
import '../screens/homepage.dart';
import '../screens/core/error.dart';
import '../screens/core/loader.dart';
import '../screens/core/settings.dart';
import '../screens/homepage.dart';
import '../screens/payment/payment.dart';
import '../screens/product/brands.dart';
import '../screens/product/cart.dart';
import '../screens/product/favorites.dart';

import '../screens/product/products.dart';


import '../screens/static/boarding.dart';
import '../screens/static/ip.dart';


final routes = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoaderScreen(),
    ),
    GoRoute(
      path: '/ip',
      builder: (context, state) => const IPScreen(),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: '/brands',
      builder: (context, state) => const BrandsScreen(),
    ),
  
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/boarding',
      builder: (context, state) => const BoardingScreen(),
    ),
    GoRoute(
      path: "/products",
      builder: (context, state) => const ProductsScreen(), 
    ),
    GoRoute(
      path: "/favorites",
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: "/cart",
      builder: (context, state) => const CartScreen(),
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
