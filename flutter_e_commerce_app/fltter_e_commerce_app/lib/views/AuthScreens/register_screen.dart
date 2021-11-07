import 'package:fltter_e_commerce_app/views/AuthScreens/social_auth_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
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
          SocialAuthButton(
            size: size,
            title: 'Sign In With Google',
            imagePath: 'assets/logos/google_logo.png',
          ),
          SocialAuthButton(
            size: size,
            title: 'Sign In With Facebook',
            imagePath: 'assets/logos/facebook_logo.png',
          ),
        ],
      ),
    );
  }
}
