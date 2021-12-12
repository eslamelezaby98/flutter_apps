import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:world_news/helper/colors_manager.dart';
import 'package:world_news/helper/value_manager.dart';

class ThemeAppManager {
 static bool small = true ;

  static ThemeData getAppTheme() {
    return ThemeData(
      //colors
      primaryColor: ColorsManager.primaryDark,
      scaffoldBackgroundColor: ColorsManager.primaryDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsManager.primaryDark2,
        elevation: AppSize.s0,
        centerTitle: true,
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
          backgroundColor: ColorsManager.seletedColor,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        caption: TextStyle(
          color: ColorsManager.white,
          fontSize: 15,
          backgroundColor: ColorsManager.seletedColor,
          fontWeight: FontWeight.w300,
        ),
        bodyText1:TextStyle(
          color: ColorsManager.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
