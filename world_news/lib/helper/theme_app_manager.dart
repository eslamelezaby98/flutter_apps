import 'package:flutter/material.dart';
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
    );
  }
}
