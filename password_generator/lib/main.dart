import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_generator/screens/home_screen.dart';
import 'package:password_generator/screens/user_info_screen.dart';
import 'package:password_generator/screens/user_profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Generator',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0.0,
          centerTitle: true,
        ),
      ),
      home: HomeScreen(),
      initialRoute: HomeScreen.screen_route,
      routes: {
        HomeScreen.screen_route: (context) => HomeScreen(),
        UserInfoScreen.screenRoute: (context) => UserInfoScreen(),
        UserProfileScreen.screen_route: (context) => UserProfileScreen()
      },
    );
  }
}
