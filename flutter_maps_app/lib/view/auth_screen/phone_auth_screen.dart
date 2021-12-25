import 'package:flutter/material.dart';
import 'package:flutter_maps_app/controller/auth_controller.dart';
import 'package:flutter_maps_app/helper/routes_manager.dart';
import 'package:flutter_maps_app/view/auth_screen/local_widgets/local_widget.dart';
import 'package:provider/provider.dart';

import 'local_widgets/user_phone_number.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthController>(context);
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
                // custom button
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () async {
                    await provider.verifyPhoneNumber();
                    Navigator.pushNamed(context, Routes.otpScreen);
                  },
                  child: const Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showProgressIndicaator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.black),
        ),
      ),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.white,
      builder: (context) {
        return alertDialog;
      },
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
