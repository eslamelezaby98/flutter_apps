import 'package:flutter/material.dart';
import 'package:flutter_maps_app/controller/auth_screen_controller.dart';
import 'package:flutter_maps_app/view/auth_screen/otp_screen.dart';
import 'package:get/get.dart';

import 'local_widgets/user_phone_number.dart';

class AuthScreen extends GetWidget<AuthScreenController> {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildHeaderText('What is your phone number?'),
                const SizedBox(height: 10),
                const Text(
                  'Please enter your phone number to verify your account',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 50),
                const UserPhoneNumberWidget(),
                const SizedBox(height: 50),
                _buildCustomButton(() => Get.to(const OTPScreen()), 'Next'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildHeaderText(String header) {
    return  Text(
      header,
      style:const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  InkWell _buildCustomButton(Function onTap, String title) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

// todo
  // validation phone number.
  // change border color of textField
