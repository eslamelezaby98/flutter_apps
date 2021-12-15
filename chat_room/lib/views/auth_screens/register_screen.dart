import 'package:chat_room/views/auth_screens/widgets/auth_button.dart';
import 'package:flutter/material.dart';

import 'package:chat_room/helper/strings_manager.dart';
import 'package:chat_room/helper/values_managers.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
//  final TextEditingController _emailController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        child: ListView(
          children: [
            // headline1
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50, bottom: 10),
              child: SizedBox(
                height: size.height / 4,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Be Together',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'with your friends',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ),
            ),
            AuthButton(
              size: size,
              imagePath: AssetsManager.googleLogoPath,
              title: StringsManager.contineWithGoogle,
              onTap: () {},
            ),
            AuthButton(
              size: size,
              imagePath: AssetsManager.facebookLogoPath,
              title: StringsManager.contineWithFacebook,
              onTap: () {},
            ),
            Center(
              heightFactor: 3,
              child: Text(
                'OR',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            // textfield
            const TextFiledInput(
              hintLabel: StringsManager.eamilHintLabel,
              isObcure: false,
            ),
            const TextFiledInput(
              hintLabel: StringsManager.passwordHintLabel,
              isObcure: true,
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              backgroundColor: Theme.of(context).highlightColor,
              onPressed: () {
                //todo:
              },
              child: const Icon(
                Icons.arrow_right_alt,
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                //todo
              },
              child: const Text(
                'I\'m Aready Have an account',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFiledInput extends StatelessWidget {
  const TextFiledInput({
    Key? key,
    required this.hintLabel,
    required this.isObcure,
  }) : super(key: key);

  final String hintLabel;
  final bool isObcure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintLabel,

          // labelText: 'Email',
        ),
        obscureText: isObcure,
      ),
    );
  }
}
