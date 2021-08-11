import 'package:e_commerce_app/constants/color.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            color: Colors.white,
          )),
      home: LoginScreen(),
    );
  }
}
