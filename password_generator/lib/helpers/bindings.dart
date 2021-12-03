import 'package:get/get.dart';
import 'package:password_generator/controllar/controllar.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyControllar());
  }
}
