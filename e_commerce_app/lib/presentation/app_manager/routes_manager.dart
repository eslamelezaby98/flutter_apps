import 'package:e_commerce_app/presentation/app_manager/strings_manager.dart';
import 'package:e_commerce_app/presentation/views/login_view.dart';
import 'package:e_commerce_app/presentation/views/main_view.dart';
import 'package:e_commerce_app/presentation/views/on_borading/on_boarding_view.dart';
import 'package:e_commerce_app/presentation/views/register_view.dart';
import 'package:e_commerce_app/presentation/views/splash_view.dart';
import 'package:e_commerce_app/presentation/views/store_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) =>  const OnBoradingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetialsView());
      default:
        return unDefindRoute();
    }
  }

  static Route<dynamic> unDefindRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            StringsManager.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(StringsManager.noRouteFound),
        ),
      ),
    );
  }
}
