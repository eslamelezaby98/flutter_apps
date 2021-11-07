import 'package:fltter_e_commerce_app/views/auth_screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  int cureentIndexOfTab = 0;

  List<Widget> authScreens = [
    RegisterScreen(),
    Center(child: Text('Auth Screen')),
  ];

  onTap(int index) {
    cureentIndexOfTab = index;
    print(cureentIndexOfTab);
    update();
  }
}
