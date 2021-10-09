import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemesProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;
  late SharedPreferences _preferences;

  ThemeData get getTheme => _selectedTheme;

  ThemeData _dark = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
     hintColor: Colors.black38,
     
  );

  ThemeData _light = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    hintColor: Colors.white,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
  );

  ThemesProvider({required bool isLigthTheme}) {
    _selectedTheme = isLigthTheme ? _light : _dark;
  }

  switchTheme() async {
    _preferences = await SharedPreferences.getInstance();
    if (_selectedTheme == _light) {
      _selectedTheme = _dark;
      await _preferences.setBool('isLightTheme', false);
    } else {
      _selectedTheme = _light;
      await _preferences.setBool('isLightTheme', true);
    }
    notifyListeners();
  }
}
