import 'package:fltter_e_commerce_app/controllers/homeScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
      init: MainScreenController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.onTap,
            currentIndex: controller.currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: '',
              ),
            ],
          ),
          body: controller.screens.elementAt(controller.currentIndex),
        );
      },
    );
  }
}
