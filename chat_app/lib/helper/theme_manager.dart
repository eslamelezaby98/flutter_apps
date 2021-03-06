import 'package:chat_app/helper/colors_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData getDarkTheme() {
    return ThemeData(
      //color
      primaryColorDark: ColorsManager.primaryDark,
      primaryColorLight: ColorsManager.greenLight,
      highlightColor: ColorsManager.green,
      hintColor: ColorsManager.white,
      errorColor: ColorsManager.red,
      
      scaffoldBackgroundColor: ColorsManager.primaryDark,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: ColorsManager.primaryDark,
      ),

      // text
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: ColorsManager.white,
          fontWeight: FontWeight.bold,
          fontSize: 60,
        ),
        bodyText2: TextStyle(
          color: ColorsManager.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        headline1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w100,
          fontSize: 20,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          color: ColorsManager.green,
        ),
        labelStyle: const TextStyle(
          color: ColorsManager.white,
        ),
        errorStyle:const TextStyle(
          color: ColorsManager.red,
        ),
        fillColor: Colors.white,
        filled: true,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ColorsManager.red,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ColorsManager.white,
            style: BorderStyle.solid,
            width: 10,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ColorsManager.green,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ColorsManager.green,
            style: BorderStyle.solid,
            width: 10,
          ),
        ),
      ),
    );
  }
}
