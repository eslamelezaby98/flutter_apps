import 'package:fltter_e_commerce_app/services/main_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}