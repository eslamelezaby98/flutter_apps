import 'package:e_commerce_fluter_app/helper/routes_manager.dart';
import 'package:e_commerce_fluter_app/helper/theme_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.getTheme(),
      initialRoute: RoutesManager.homeScreen,
      onGenerateRoute: RoutesManager.generateRoutes,
    );
  }
}
