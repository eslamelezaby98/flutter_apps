import 'package:flutter/material.dart';

class Themes {
  // ligth mode
  static final lightMode = ThemeData(
    primaryColor: Colors.greenAccent,
    brightness: Brightness.light,
  );

  // Dark mode
  static final darkMode = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
  );
}
