import 'package:chat_room/helper/routes_manager.dart';
import 'package:chat_room/helper/theme_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.getDarkTheme(),
      onGenerateRoute: RoutesGenerator.generateRoute,
     initialRoute: Routes.registerScreen,
    );
  }
}