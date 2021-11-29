import 'package:fltter_e_commerce_app/helpers/binding.dart';
import 'package:fltter_e_commerce_app/views/auth_screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helpers/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OpenSans',
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          color: Colors.white,
          actionsIconTheme: IconThemeData(
            color: kSecondColor,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kMainColor,
          unselectedItemColor: Colors.black26,
          selectedItemColor: kSecondColor,
        ),
        indicatorColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
          ),
        ),
       primaryColor: Colors.white,
      ),
      home: AuthScreen(),
    );
  }
}
