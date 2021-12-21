import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/views/auth_screen/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
                hintLabel: 'Enter your email',
                isObcure: false,
                onChange: authProvider.onPasswordChange,
                textEditingController: authProvider.passwordController,
                validator: authProvider.valiatorpassword,
              ),
              FloatingActionButton(
                onPressed: () {
                  //TODO: 
                  //1# validation
                  // 2# register
                  // 3# go to chat screen.
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
}
