import 'package:e_commerce_fluter_app/helper/color_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorManager.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(
            color: Colors.black,
            width: 20,
            style: BorderStyle.solid,
          ),
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.black87,
          fontSize: 30,
        ),
        headline2: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        headline3: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize:15,
        ),
        caption: TextStyle(
          color: ColorManager.secondColor,
          // fontWeight: FontWeight.bold,
          fontSize:15,
        ),
      ),
    );
  }
}
