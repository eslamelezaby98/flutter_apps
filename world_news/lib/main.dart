import 'package:flutter/material.dart';
import 'package:world_news/helper/router_manager.dart';
import 'package:world_news/helper/theme_app_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:  ThemeAppManager.getAppTheme(),
    onGenerateRoute: RoutesGenerator().generateRoutes,
    initialRoute: Routes.mainSreen,
    );
  }
}