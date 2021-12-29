import 'package:flutter/material.dart';

class ViewsController extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> views = [
    
  ];
  onTap(newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
