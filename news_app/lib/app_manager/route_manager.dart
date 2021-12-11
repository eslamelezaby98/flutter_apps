import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_manager/strings_manager.dart';
import 'package:news_app/views/article_detials_screen.dart';
import 'package:news_app/views/category_screen.dart';
import 'package:news_app/views/country_screen.dart';
import 'package:news_app/views/home_screen.dart';
import 'package:news_app/views/setting_screen.dart';

class Routes {
  static const String homeScreen = '/';
  static const String articleDetialsScreen = 'articleDetialsScreen';
  static const String categoriesScreen = 'categoriesScreen';
  static const String countryScreen = 'countryScreen';
  static const String settingScreen = 'settingScreen';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.articleDetialsScreen:
        return MaterialPageRoute(
          builder: (_) => const ArticleDetialsScreen(),
        );
      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (_) => const CategoryScreen(),
        );
      case Routes.settingScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      case Routes.countryScreen:
        return MaterialPageRoute(
          builder: (_) => const CountryScreen(),
        );
      default:
        return unDefindScreen();
    }
  }

  static Route<dynamic> unDefindScreen() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(StringsManager.noRouteFound),
          ),
          body: const Center(
            child: Text(StringsManager.noRouteFound),
          ),
        );
      },
    );
  }
}
