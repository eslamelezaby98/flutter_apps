import 'package:fltter_e_commerce_app/controllers/AuthController.dart';
import 'package:fltter_e_commerce_app/controllers/homeScreenController.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => MainScreenController());
  }
}
