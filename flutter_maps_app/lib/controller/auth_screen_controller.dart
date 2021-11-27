import 'package:get/get.dart';

class AuthScreenController extends GetxController {
  String dropdownValue = 'Egypt';
  List<String> conturies = ['Egypt', 'US', 'England'];

  onChange(String? newValue) {
    dropdownValue = newValue!;
    update();
  }
}
