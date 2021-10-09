import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late SharedPreferences prefs;

  // Need a selected theme.
  late ThemeData _selectedTheme;

  //Declare a dark and a light theme
  ThemeData _light = ThemeData(
    primaryColor: Colors.lightGreenAccent,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
  );

  ThemeData _dark = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
  );

  // Constructor to select a dark or light theme.
  ThemeProvider({required bool isDarkTheme}) {
    _selectedTheme = isDarkTheme ? _dark : _light;
  }

  // getTheme method
  ThemeData get getTheme => _selectedTheme;

  // Implement a switchTheme method that changes the current theme.
  switchTheme() async {
    prefs = await SharedPreferences.getInstance();
    if (_selectedTheme == _dark) {
      _selectedTheme = _light;
      await prefs.setBool('isDarkTheme', false);
    } else {
      _selectedTheme = _dark;
      await prefs.setBool('isDarkTheme', true);
    }
    notifyListeners();
  }

  // shared_preferences

}
