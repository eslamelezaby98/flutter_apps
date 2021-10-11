import 'package:fltter_e_commerce_app/screens/cart_screen.dart';
import 'package:fltter_e_commerce_app/screens/home_screen.dart';
import 'package:fltter_e_commerce_app/screens/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  final List<Widget> screens = <Widget>[
    HomeScreen(),
    CartScreen(),
    Center(
      child: Text(
        'Account',
      ),
    ),
    MenuScreen(),
  ];

  int cureentIndex = 0;

  onTap(int index) {
    cureentIndex = index;
    print(index);
    notifyListeners();
  }

  // Categories Provider Method
  final List categories = [
    Center(
      child: Text(
        'Top Deals',
      ),
    ),
    Center(
      child: Text(
        'Supermarket',
      ),
    ),
    Center(
      child: Text(
        'Fashion',
      ),
    ),
    Center(
      child: Text(
        'Mobiles',
      ),
    ),
    Center(
      child: Text(
        'Home',
      ),
    ),
    Center(
      child: Text(
        'Beauty',
      ),
    ),
    Center(
      child: Text(
        'Electronics',
      ),
    ),
    Center(
      child: Text(
        'COVID-19',
      ),
    )
  ];
}
