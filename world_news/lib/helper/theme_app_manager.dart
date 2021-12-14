import 'package:flutter/material.dart';
import 'package:world_news/helper/colors_manager.dart';
import 'package:world_news/helper/value_manager.dart';

class ThemeAppManager {
  static bool small = true;

  static ThemeData getAppTheme() {
    return ThemeData(
      //colors
      primaryColor: ColorsManager.primaryDark,
      scaffoldBackgroundColor: ColorsManager.primaryDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsManager.primaryDark2,
        elevation: AppSize.s0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: ColorsManager.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsManager.primaryDark2,
        selectedItemColor: ColorsManager.seletedColor,
        unselectedItemColor: ColorsManager.white,
      ),
      iconTheme: const IconThemeData(
        color: ColorsManager.seletedColor,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: ColorsManager.white,
          fontSize: 14,
          // backgroundColor: ColorsManager.seletedColor,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
        headline2: TextStyle(
          color: ColorsManager.white,
          fontSize: 20,
          textBaseline: TextBaseline.alphabetic,
        ),
        headline3: TextStyle(
          color: ColorsManager.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
        headline4: TextStyle(
          color: ColorsManager.white,
          fontSize: 15,
          fontWeight: FontWeight.w300,
          wordSpacing: 3,
          letterSpacing: 2,
        ),
        caption: TextStyle(
          color: ColorsManager.seletedColor,
          fontSize: 15,
          // backgroundColor: ColorsManager.seletedColor,
          fontWeight: FontWeight.w300,
        ),
        bodyText1: TextStyle(
          color: ColorsManager.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static ThemeData getLightTheme() {
    return ThemeData(
      //colors
      primaryColor: ColorsManager.white,
      primaryColorDark: ColorsManager.primaryDark2,
      scaffoldBackgroundColor: ColorsManager.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsManager.white,
        elevation: AppSize.s0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: ColorsManager.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsManager.primaryDark2,
        selectedItemColor: ColorsManager.seletedColor,
        unselectedItemColor: ColorsManager.white,
      ),
      iconTheme: const IconThemeData(
        color: ColorsManager.seletedColor,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: ColorsManager.white,
          fontSize: 14,
          // backgroundColor: ColorsManager.seletedColor,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
        headline2: TextStyle(
          color: ColorsManager.white,
          fontSize: 20,
          textBaseline: TextBaseline.alphabetic,
        ),
        headline3: TextStyle(
          color: ColorsManager.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
        headline4: TextStyle(
          color: ColorsManager.white,
          fontSize: 15,
          fontWeight: FontWeight.w300,
          wordSpacing: 3,
          letterSpacing: 2,
        ),
        caption: TextStyle(
          color: ColorsManager.seletedColor,
          fontSize: 15,
          // backgroundColor: ColorsManager.seletedColor,
          fontWeight: FontWeight.w300,
        ),
        bodyText1: TextStyle(
          color: ColorsManager.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
