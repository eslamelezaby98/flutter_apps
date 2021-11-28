import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  String dropdownValue = 'Egypt';
  List<String> conturies = ['Egypt', 'US', 'England'];
  String phoneNumber = '';
  TextEditingController phoneNumberController = TextEditingController();  

  onChange(String? newValue) {
    dropdownValue = newValue!;
    update();
  }

  onSave(String? value) {
    phoneNumber = value!;
    update();
  }
}
