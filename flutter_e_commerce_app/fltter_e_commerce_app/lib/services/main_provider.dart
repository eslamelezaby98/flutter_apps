import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  List<Widget> screens = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ];

  int selectedScreenIndex = 0;

  onTap(int index) {
    selectedScreenIndex = index;
    print(index);
    notifyListeners();
  }
}