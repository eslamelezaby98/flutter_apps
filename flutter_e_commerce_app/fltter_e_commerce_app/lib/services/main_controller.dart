import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  int currentIndex = 0;
   late TabController _tabController;
   
  onTap(int index) {
    currentIndex = index;
    update();
  }

 

}
