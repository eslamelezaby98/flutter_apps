import 'package:flutter/material.dart';
import 'package:weather_app/helper/routes_manager.dart';
import 'package:weather_app/helper/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager().getTheme(),
      onGenerateRoute: GenerateRoutes().onGenerateRoutes,
      initialRoute: Routes.searchScreen,
    );
  }
}
