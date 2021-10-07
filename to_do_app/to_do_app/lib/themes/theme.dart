import 'package:flutter/material.dart';

// Remmber: we should state management to change a mode

class Themes {
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
