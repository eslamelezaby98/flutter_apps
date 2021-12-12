import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_news/presentation/screens/home_screen.dart';
import 'package:world_news/presentation/screens/main_screen.dart';

class Routes {
  static const String mainSreen = '/';
  static const String trendingScreen = '/trendingScreen';
}

class RoutesGenerator {
  static Route<dynamic>? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainSreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.trendingScreen:
        return MaterialPageRoute(builder: (_) => const TrendingScreen());
      default:
        unDefindRoute();
    }
  }

  static Route<dynamic> unDefindRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Not Found Route'),
        ),
        body: const Center(
          child: Text('Not Found Route'),
        ),
      ),
    );
  }
}
