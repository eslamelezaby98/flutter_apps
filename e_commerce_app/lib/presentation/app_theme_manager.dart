import 'package:e_commerce_app/presentation/color_manager.dart';
import 'package:e_commerce_app/presentation/value_manager.dart';
import 'package:flutter/material.dart';

class AppThemeManager {
  static ThemeData getAppTheme() {
    return ThemeData(
      // main color
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkGrey,
      disabledColor: ColorManager.grey1,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: ColorManager.grey,
      ),

      // card theme.
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),
    );
  }
}
