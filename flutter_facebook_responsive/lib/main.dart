import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive/app_manager/routes_manager.dart';
import 'package:flutter_facebook_responsive/app_manager/theme_manager.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager().getAppTheme(),
      initialRoute: RoutesManager.homeScreen,
      onGenerateRoute: RoutesManager.generateRoutes,
    );
  }
}