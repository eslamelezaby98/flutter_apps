import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_generator/screens/home_screen.dart';

import 'helpers/bindings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Password Generator',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
