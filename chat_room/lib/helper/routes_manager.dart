import 'package:chat_room/helper/strings_manager.dart';
import 'package:chat_room/views/auth_screens/register_screen.dart';
import 'package:chat_room/views/auth_screens/sign_in_screen.dart';
import 'package:chat_room/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashScreen = '/';
  static const String onBoarindingScreen = '/onBoarindingScreen';
  static const String registerScreen = '/registerScreen';
  static const String signInScreen = '/signInScreen';
  static const String homeScreen = '/homeScreen';
  static const String chatScreen = '/chatScreen';
}

class RoutesGenerator {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) =>const  RegisterScreen(),
        );
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        undefindRoute();
    }
  }

  static undefindRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsManager.undefindRoute),
      ),
      body: const Center(
        child: Text(StringsManager.undefindRoute),
      ),
    );
  }
}
