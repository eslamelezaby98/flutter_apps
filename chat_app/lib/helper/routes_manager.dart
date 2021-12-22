import 'package:chat_app/helper/strings_manager.dart';
import 'package:chat_app/views/auth_screen/register_screen.dart';
import 'package:chat_app/views/auth_screen/sign_in_screen.dart';
import 'package:chat_app/views/chat_screen/chat_screen.dart';
import 'package:chat_app/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashScreen = '/';
  static const String onBoarindingScreen = '/onBoarindingScreen';
  static const String registerScreen = '/registerScreen';
  static const String signInScreen = '/signInScreen';
  static const String chatScreen = '/chatScreen';
  static const String homeScreen = '/homeScreen';
}

class RoutesGenerator {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case Routes.chatScreen:
        return MaterialPageRoute(
          builder: (context) => const ChatScreen(),
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
