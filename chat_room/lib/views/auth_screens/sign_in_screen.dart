import 'package:chat_room/helper/colors_manager.dart';
import 'package:chat_room/helper/routes_manager.dart';
import 'package:chat_room/helper/strings_manager.dart';
import 'package:chat_room/helper/values_managers.dart';
import 'package:chat_room/views/auth_screens/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
        const  Align(
            alignment: Alignment.topLeft,
            child:  BackButton(
              color: ColorsManager.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, bottom: 20),
            child: Text(
             StringsManager.welcome,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          AuthButton(
            size: size,
            title: StringsManager.contineWithGoogle,
            imagePath: AssetsManager.googleLogoPath,
            onTap: () {},
          ),
          AuthButton(
            size: size,
            title: StringsManager.contineWithFacebook,
            imagePath: AssetsManager.facebookLogoPath,
            onTap: () {},
          ),
          Center(
            heightFactor: 3,
            child: Text(
              StringsManager.or,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          // const TextFiledInput(
          //   hintLabel: StringsManager.eamilHintLabel,
          //   isObcure: false,
          // ),
          // const TextFiledInput(
          //   hintLabel: StringsManager.passwordHintLabel,
          //   isObcure: true,
          // ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Theme.of(context).highlightColor,
            onPressed: () {
              Navigator.pushNamed(context, Routes.homeScreen);
            },
            child: const Icon(
              Icons.arrow_right_alt,
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              //
            },
            child: Text(
              StringsManager.forgetMyPassword,
               style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ],
      ),
    );
  }
}
