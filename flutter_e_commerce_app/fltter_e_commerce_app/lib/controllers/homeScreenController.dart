import 'package:fltter_e_commerce_app/views/cart_screen.dart';
import 'package:fltter_e_commerce_app/views/homeScreen/home_screen.dart';
import 'package:fltter_e_commerce_app/views/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  List<Widget> screens = <Widget>[
    HomeScreen(),
    CartScreen(),
    UserProfile(),
  ];

  int currentIndex = 0;

  onTap(int index) {
    currentIndex = index;
    print(currentIndex);
    update();
  }
}
