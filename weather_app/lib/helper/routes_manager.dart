import 'package:flutter/material.dart';
import 'package:weather_app/views/screens/country_screen/country_screen.dart';
import 'package:weather_app/views/screens/search_screen/search_screen.dart';

class Routes {
  static const String searchScreen = '/';
  static const String countryScreen = '/countryScreen';
}

class GenerateRoutes {
  Route? onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case Routes.countryScreen:
        return MaterialPageRoute(
          builder: (context) => const CountryScreen(),
        );
      default:
        defaultRoute();
    }
  }

  defaultRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Default Route'),
      ),
      body: const Center(
        child: Text('No Route Found'),
      ),
    );
  }
}
