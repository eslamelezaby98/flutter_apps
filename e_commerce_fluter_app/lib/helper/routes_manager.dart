import 'package:e_commerce_fluter_app/views/checkout_screen/checkout_screen.dart';
import 'package:e_commerce_fluter_app/views/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static const String homeScreen = '/';
  static const String checkoutScreen = '/checkoutScreen';

  static Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
      case checkoutScreen:
        return MaterialPageRoute(
          builder: (context) => const CheckoutScreen(),
        );

      default:
        return defaultRoute();
    }
  }

  static defaultRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('defaultRoute'),
      ),
    );
  }
}
