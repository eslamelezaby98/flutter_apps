import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/helper/constants_manager.dart';
import 'package:chat_app/helper/routes_manager.dart';
import 'package:chat_app/views/auth_screen/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthController>(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: authProvider.registerFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chat App',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Be closer with your family and friends',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                'Create a new account now..',
                style: Theme.of(context).textTheme.headline1,
              ),
              TextFiledInput(
                hintLabel: 'Enter your name',
                isObcure: false,
                onChange: authProvider.onUserNameChange,
                textEditingController: authProvider.userNameController,
                validator: authProvider.valiatorUserName,
              ),
              TextFiledInput(
                hintLabel: 'Enter your email',
                isObcure: false,
                onChange: authProvider.onEmailChange,
                textEditingController: authProvider.emailController,
                validator: authProvider.valiatorEmail,
              ),
              TextFiledInput(
                hintLabel: 'Enter your password',
                isObcure: true,
                onChange: authProvider.onPasswordChange,
                textEditingController: authProvider.passwordController,
                validator: authProvider.valiatorpassword,
              ),
              FloatingActionButton(
                onPressed: () async {
                  await register(authProvider, context);
                },
                child: const Icon(Icons.arrow_forward),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signInScreen);
                },
                child: const Text(
                  'Aleardy have an account',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register(
      AuthController authProvider, BuildContext context) async {
    try {
      var user = await authProvider.createUserWithEmailAndPassword();

      if (user != null) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            title: Text('Loading'),
          ),
        );

        authProvider.uploadUserInfo({
          ConstantsManager.userName: authProvider.userNameController.text,
          ConstantsManager.userEmail: authProvider.emailController.text
        });
        Navigator.pushNamed(context, Routes.homeScreen);
        authProvider.emailController.clear();
        authProvider.passwordController.clear();
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            title: Text('Try Again'),
          ),
        );
      }
    } catch (e) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => const AlertDialog(
          title: Text('Try Again'),
        ),
      );
    }
  }
}
