import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  final List<Widget> screens = <Widget>[
    Center(
      child: Text(
        'Home',
      ),
    ),
    Center(
      child: Text(
        'Shopping cart',
      ),
    ),
    Center(
      child: Text(
        'Account',
      ),
    )
  ];

  int cureentIndex = 0;

  onTap(int index) {
    cureentIndex = index;
    print(index);
    notifyListeners();
  }
}
