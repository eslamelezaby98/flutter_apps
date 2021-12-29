import 'package:flutter/material.dart';
import 'package:weather_app/helper/color_manager.dart';

class ThemeManager {
  ThemeData getTheme() {
    return ThemeData(
      //color
      scaffoldBackgroundColor: ColorManager.primaryColor,
      primaryColor: ColorManager.primaryColor,
      errorColor: Colors.red,

      appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.primaryColor,
        centerTitle: true,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      // text field
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: ColorManager.white),
        labelStyle: const TextStyle(color: ColorManager.white),
        focusColor: ColorManager.white,
        prefixIconColor: ColorManager.white,
        suffixIconColor: ColorManager.white,
        // borders
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: ColorManager.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: ColorManager.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: ColorManager.secondColor),
        ),
      ),
      // text
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: ColorManager.secondColor,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: ColorManager.white,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
        caption: TextStyle(
          fontSize: 10,
        ),
        subtitle1: TextStyle(
          color: ColorManager.black,
          fontSize: 20,
        ),
        headline3: TextStyle(
           color: ColorManager.black,
          fontSize: 15,
        ),
        headline4: TextStyle(
           color: ColorManager.secondColor,
          fontSize: 15,
        ),
      ),
    );
  }
}
