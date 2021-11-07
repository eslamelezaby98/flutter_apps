import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              'assets/logos/app_logo.png',
            ),
            height: size.height / 4,
          ),
          Text(
            'Welcome to Mesh Amazon',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 10),
          Text(
            'Create a new account now..',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SignInButton(
            size: size,
            title: 'Sign in with Google',
            imagePath: 'assets/logos/google_logo.png',
          ),
          SignInButton(
            size: size,
            title: 'Sign in with Facebook',
            imagePath: 'assets/logos/facebook_logo.png',
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              // go to login screen
              //Get.to()
            },
            child: Text(
              'Already have an account.',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    required this.size,
    required this.title,
    required this.imagePath,
  });

  final Size size;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.red),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(imagePath),
                height: 40,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
