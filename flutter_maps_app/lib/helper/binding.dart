import 'package:flutter_maps_app/controller/auth_screen_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthScreenController());
  }
}
