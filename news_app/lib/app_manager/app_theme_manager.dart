import 'package:flutter/material.dart';
import 'package:news_app/app_manager/app_size_manager.dart';
import 'package:news_app/app_manager/app_style_manager.dart';
import 'package:news_app/app_manager/color_manager.dart';
import 'package:news_app/app_manager/font_manager.dart';

class AppThemeManager {
  static ThemeData getAppTheme() {
    return ThemeData(
      // main color
      scaffoldBackgroundColor: ColorManager.white,
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.black,
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
        elevation: AppSize.s0,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle: TextStyleManager().getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s20,
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
          color: ColorManager.black,
          fontSize: FontSizeManager.s40,
        ),
        headline2: TextStyleManager().getSuemiBoldStyle(
          color: ColorManager.black,
          fontSize: FontSizeManager.s30,
        ),
        subtitle1: TextStyleManager().getMediumStyle(
          color: ColorManager.lightGrey,
          fontSize: FontSizeManager.s14,
        ),
        caption: TextStyleManager().getRegularStyle(
          color: ColorManager.grey1,
        ),
        bodyText1: TextStyleManager().getBoldStyle(
          color: ColorManager.black,
        
        ),
        bodyText2: TextStyleManager().getRegularStyle(
          color: ColorManager.lightGrey,
        
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle:
            TextStyleManager().getRegularStyle(color: ColorManager.grey1),
        labelStyle:
            TextStyleManager().getMediumStyle(color: ColorManager.black),
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
