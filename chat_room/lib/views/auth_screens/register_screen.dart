import 'package:chat_room/controllers/auth_model_view.dart';
import 'package:chat_room/helper/routes_manager.dart';
import 'package:chat_room/views/auth_screens/widgets/auth_button.dart';
import 'package:chat_room/views/auth_screens/widgets/text_filed_input.dart';
import 'package:flutter/material.dart';

import 'package:chat_room/helper/strings_manager.dart';
import 'package:chat_room/helper/values_managers.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var authViewModelProvider =
        Provider.of<AuthModelView>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: authViewModelProvider.formKey,
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
                      StringsManager.beTogethor,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      StringsManager.withYourFriends,
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
              onTap: authViewModelProvider.signInWithGoogle,
            ),
            AuthButton(
              size: size,
              imagePath: AssetsManager.facebookLogoPath,
              title: StringsManager.contineWithFacebook,
              onTap: //todo:
                  () {},
            ),
            Center(
              heightFactor: 3,
              child: Text(
                StringsManager.or,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            // textfield
            TextFiledInput(
              hintLabel: StringsManager.eamilHintLabel,
              isObcure: false,
              onChange: authViewModelProvider.onEmailChange,
              textEditingController: authViewModelProvider.emailTextController,
            ),
            TextFiledInput(
              hintLabel: StringsManager.passwordHintLabel,
              isObcure: true,
              onChange: authViewModelProvider.onPasswordChange,
              textEditingController:
                  authViewModelProvider.passwordTextController,
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              backgroundColor: Theme.of(context).highlightColor,
              onPressed: () {
                var result =
                    authViewModelProvider.createUserWithEmailAndPassword();
                if (result == null) {
                } else {
                  Navigator.pushNamed(context, Routes.signInScreen);
                }
              },
              child: const Icon(
                Icons.arrow_right_alt,
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text(
                StringsManager.arleadyHaveAnAccount,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
