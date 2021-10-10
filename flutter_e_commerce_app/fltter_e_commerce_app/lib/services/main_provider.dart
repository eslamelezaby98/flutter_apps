import 'package:fltter_e_commerce_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  final List<Widget> screens = <Widget>[
    HomeScreen(),
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
