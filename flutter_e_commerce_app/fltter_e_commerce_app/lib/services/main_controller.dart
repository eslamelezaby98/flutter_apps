import 'package:get/get.dart';

class MainController extends GetxController {
  int currentIndex = 0;
  onTap(int index) {
    currentIndex = index;
    update();
  }
}
