import 'package:e_commerce_app/core/auth.dart';
import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetxController {
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (Get.find<Auth>().user == null) ? LoginScreen() : HomeScreen();
      },
    );
  }
}
