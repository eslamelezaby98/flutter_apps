import 'package:flutter/material.dart';
import 'color_manager.dart';

class ThemeManager {
  ThemeData getAppTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: ColorManager.scffoldColor,
    );
  }
}
