import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/data/services/shared_pref.dart';
import 'package:chat_app/helper/routes_manager.dart';
import 'package:chat_app/views/auth_screen/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthController>(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: authProvider.signInFormKey,
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
                'Welcome Back...',
                style: Theme.of(context).textTheme.headline1,
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
                  await signIn(authProvider, context);
                },
                child: const Icon(Icons.arrow_forward),
              ),
              TextButton(
                onPressed: () {
                  // go to chat screen
                },
                child: const Text(
                  'Forget my password !',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn(AuthController authProvider, BuildContext context) async {
    try {
      var user = await authProvider.signInWithEmailAndPassword();
      if (user != null) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            title: Text('Loading'),
          ),
        );
        dbHelper.setUserName(authProvider.userNameController.text);
        dbHelper.setUserEmail(authProvider.emailController.text);
        dbHelper.isUserLoggedIn(true);
        authProvider.emailController.clear();
        authProvider.passwordController.clear();
        Navigator.pushNamed(context, Routes.homeScreen);
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
