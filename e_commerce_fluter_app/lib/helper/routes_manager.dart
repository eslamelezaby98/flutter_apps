import 'package:e_commerce_fluter_app/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static const String homeScreen = '/';

  static Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
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
