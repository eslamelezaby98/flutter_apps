import 'package:get/get.dart';

class AuthScreenController extends GetxController {
  String dropdownValue = 'Egypt';
  List<String> conturies = ['Egypt', 'US', 'England'];
  String phoneNumber = '';

  onChange(String? newValue) {
    dropdownValue = newValue!;
    update();
  }

  onSave(String? value) {
    phoneNumber = value!;
    update();
  }
}
