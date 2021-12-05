import 'package:e_commerce_app/presentation/font_manager.dart';
import 'package:flutter/cupertino.dart';

class TextStyleManager {
  TextStyle _getTextStyle(
      double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle getRegularStyle(
      {double fontSize = FontSizeManager.s12, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontCostants.fontFamily,
      FontWeightManager.regular,
      color,
    );
  }

  TextStyle getLightStyle(
      {double fontSize = FontSizeManager.s12, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontCostants.fontFamily,
      FontWeightManager.light,
      color,
    );
  }

  TextStyle getBoldStyle(
      {double fontSize = FontSizeManager.s12, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontCostants.fontFamily,
      FontWeightManager.bold,
      color,
    );
  }

  TextStyle getSuemiBoldStyle(
      {double fontSize = FontSizeManager.s12, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontCostants.fontFamily,
      FontWeightManager.semiBold,
      color,
    );
  }

  TextStyle getMediumStyle(
      {double fontSize = FontSizeManager.s12, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontCostants.fontFamily,
      FontWeightManager.medium,
      color,
    );
  }
}
