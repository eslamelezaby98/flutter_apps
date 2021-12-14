import 'package:flutter/cupertino.dart';

class ThemeController extends ChangeNotifier {
  bool isDark = false;

  onTap(bool newTheme) {
    isDark = newTheme;
    notifyListeners();
  }
}
