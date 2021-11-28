import 'package:flutter/material.dart';
import 'package:flutter_maps_app/controller/auth_controller.dart';
import 'package:flutter_maps_app/view/auth_screen/local_widgets/local_widget.dart';
import 'package:flutter_maps_app/view/auth_screen/otp_screen.dart';
import 'package:get/get.dart';

import 'local_widgets/user_phone_number.dart';

class AuthScreen extends GetWidget<AuthController> {
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
                LocalWidget.buildHeaderText('What is your phone number?'),
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
                LocalWidget.buildCustomButton(
                  () => Get.to(const OTPScreen()),
                  'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//todo
  // sent phone number to firebse to sent code to user
  //process
  // user input his phone number
  // validation TextForm
  // if phone number is valid , make loading
  // move to otp_screen.
