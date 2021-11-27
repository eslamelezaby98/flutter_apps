import 'package:flutter/material.dart';
import 'package:flutter_maps_app/controller/auth_screen_controller.dart';
import 'package:get/get.dart';

class AuthScreen extends GetWidget<AuthScreenController> {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'What is your phone number?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Please enter your phone numberto verify your accout',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 50),
                GetBuilder<AuthScreenController>(
                  init: AuthScreenController(),
                  builder: (controller) {
                    return DropdownButton<String>(
                      value: controller.dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: controller.onChange,
                      items: controller.conturies
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
