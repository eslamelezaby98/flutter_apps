import 'package:e_commerce_app/core/auth.dart';
import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_social_button.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<Auth> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      // color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xff61c669),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Sign in to contine',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 60),
              CustomTextField(
                hintText: 'max@example.com',
                title: 'Email',
                onSave: (value) {},
                validator: (value) {},
              ),
              SizedBox(height: 30),
              CustomTextField(
                hintText: '***********',
                title: 'Password',
                isObscured: true,
                onSave: (value) {},
                validator: (value) {},
              ),
              SizedBox(height: 5),
              Text(
                'Forget a password',
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(height: 30),
              CustomButton(
                title: 'Sign In',
                buttonSize: size.width,
                onPress: () {},
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  '-OR-',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomSocialButton(
                title: 'Continue With Google',
                buttonColor: Colors.white,
                imagePath: 'assets/images/google_logo.png',
                onTap: () async {
                  await controller.signInWithGoogle();
                  Get.to(HomeScreen());
                  // Get.to(HomeScreen());
                },
              ),
              SizedBox(height: 15),
              CustomSocialButton(
                title: 'Continue With Facebook',
                buttonColor: Colors.white,
                imagePath: 'assets/images/facebook_logo.png',
                onTap: () {
                  Get.to(()=>HomeScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
