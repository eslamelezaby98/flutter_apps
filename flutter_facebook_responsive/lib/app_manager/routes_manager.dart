import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive/views/screens/home_screen/home_screen.dart';

class RoutesManager {
  static const String homeScreen = '/home';

 static Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const DefaultRoute(),
        );
    }
  }
}

class DefaultRoute extends StatelessWidget {
  const DefaultRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DefaultRoute'),
      ),
    );
  }
}
