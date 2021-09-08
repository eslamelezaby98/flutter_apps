import 'package:e_commerce_app/core/auth.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Auth());
  }
}
