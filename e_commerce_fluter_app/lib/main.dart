import 'package:e_commerce_fluter_app/data/data_provider/main_screen_provider.dart';
import 'package:e_commerce_fluter_app/helper/routes_manager.dart';
import 'package:e_commerce_fluter_app/helper/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.getTheme(),
        initialRoute: RoutesManager.homeScreen,
        onGenerateRoute: RoutesManager.generateRoutes,
      ),
    );
  }
}
