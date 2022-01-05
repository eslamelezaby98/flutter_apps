import 'package:e_commerce_fluter_app/views/cart_screen/cart_screen.dart';
import 'package:e_commerce_fluter_app/views/home_screen/home_screen.dart';
import 'package:e_commerce_fluter_app/views/search_screen/search_screen.dart';
import 'package:e_commerce_fluter_app/views/user_profile_screen/user_profile_screen.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> screens = const[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    UserProfileScreen(),
  ];

  onTap(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
