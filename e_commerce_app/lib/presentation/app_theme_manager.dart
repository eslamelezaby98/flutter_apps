import 'package:e_commerce_app/presentation/color_manager.dart';
import 'package:e_commerce_app/presentation/font_manager.dart';
import 'package:e_commerce_app/presentation/style_manager.dart';
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
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle: TextStyleManager().getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s16,
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle:
                TextStyleManager().getRegularStyle(color: ColorManager.white),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12),
            )),
      ),
      textTheme: TextTheme(
        headline1: TextStyleManager().getSuemiBoldStyle(
          color: ColorManager.darkGrey,
          fontSize: FontSizeManager.s16,
        ),
        subtitle1: TextStyleManager().getMediumStyle(
          color: ColorManager.lightGrey,
          fontSize: FontSizeManager.s14,
        ),
        caption: TextStyleManager().getRegularStyle(
          color: ColorManager.grey1,
        ),
        bodyText1: TextStyleManager().getRegularStyle(
          color: ColorManager.grey,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle:
            TextStyleManager().getRegularStyle(color: ColorManager.grey1),
        labelStyle:
            TextStyleManager().getMediumStyle(color: ColorManager.darkGrey),
        errorStyle:
            TextStyleManager().getRegularStyle(color: ColorManager.error),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.grey,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.error,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
      ),
    );
  }
}
