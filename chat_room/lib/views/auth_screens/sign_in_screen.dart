import 'package:chat_room/controllers/auth_model_view.dart';
import 'package:chat_room/helper/colors_manager.dart';
import 'package:chat_room/helper/routes_manager.dart';
import 'package:chat_room/helper/strings_manager.dart';
import 'package:chat_room/helper/values_managers.dart';
import 'package:chat_room/views/auth_screens/widgets/auth_button.dart';
import 'package:chat_room/views/auth_screens/widgets/text_filed_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var authViewModelProvider =
        Provider.of<AuthModelView>(context, listen: false);
    return Scaffold(
      body: Form(
        key: authViewModelProvider.formSignInKey,
        child: ListView(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: BackButton(
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
            TextFiledInput(
              hintLabel: StringsManager.eamilHintLabel,
              isObcure: false,
              textEditingController: authViewModelProvider.emailTextController,
              onChange: authViewModelProvider.onEmailChange,
              validator: authViewModelProvider.valiatorEmail,
            ),
            TextFiledInput(
              hintLabel: StringsManager.passwordHintLabel,
              isObcure: true,
              textEditingController:
                  authViewModelProvider.passwordTextController,
              onChange: authViewModelProvider.onPasswordChange,
              validator: authViewModelProvider.valiatorpassword,
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              backgroundColor: Theme.of(context).highlightColor,
              onPressed: () async {
                
                try {
                  var user =
                    await authViewModelProvider.signInWithEmailAndPassword();
                  if (user != null) {
                     showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => const AlertDialog(
                        title: Text('Loading'),
                        content: CircleAvatar(
                          
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                    Navigator.pushReplacementNamed(context, Routes.homeScreen);
                  } else {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => const AlertDialog(
                        title: Text('User is vaild'),
                      ),
                    );
                  }
                } catch (e) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(e.toString()),
                    ),
                  );
                }
              },
              child: const Icon(
                Icons.arrow_right_alt,
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: (){},
              child: Text(
                StringsManager.forgetMyPassword,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
