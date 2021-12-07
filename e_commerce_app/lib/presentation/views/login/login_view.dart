import 'package:e_commerce_app/presentation/app_manager/assets_maanger.dart';
import 'package:e_commerce_app/presentation/app_manager/strings_manager.dart';
import 'package:e_commerce_app/presentation/app_manager/value_manager.dart';
import 'package:e_commerce_app/presentation/views/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _loginViewModel = LoginViewModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  _binding() {
    _loginViewModel.start();
    _emailController
        .addListener(() => _loginViewModel.setUserEmail(_emailController.text));
    _passwordController.addListener(
        () => _loginViewModel.setUserPassword(_passwordController.text));
  }

  @override
  void initState() {
    _binding();
    super.initState();
  }

  @override
  void dispose() {
    _loginViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: AppSize.s12,
          ),
          child: SizedBox(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // image
                    SvgPicture.asset(AssetManager.onboardingLogo1),
                    StreamBuilder<bool>(
                      stream: _loginViewModel.isUserEmailValid,
                      initialData: false,
                      builder: (context, snapshot) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: AppSize.s8,
                            right: AppSize.s8,
                            top: AppSize.s12,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: StringsManager.userEmail,
                              labelText: StringsManager.userEmail,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : StringsManager.userEmailError,
                            ),
                          ),
                        );
                      },
                    ),
                    StreamBuilder<bool>(
                      stream: _loginViewModel.isUserPasswordValid,
                      initialData: false,
                      builder: (context, snapshot) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: AppSize.s8,
                            right: AppSize.s8,
                            top: AppSize.s12,
                          ),
                          child: TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: StringsManager.userPassword,
                              labelText: StringsManager.userPassword,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : StringsManager.userPasswordError,
                            ),
                          ),
                        );
                      },
                    ),
                    StreamBuilder(
                      // stream: ,
                      // initialData: ,
                      builder: (context, snapshot) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: AppSize.s60,
                            bottom: AppSize.s60,
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Login'),
                            style: ElevatedButton.styleFrom(
                              minimumSize:
                                  const Size(AppSize.s200, AppSize.s40),
                            ),
                          ),
                        );
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            StringsManager.forgetPassword,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            StringsManager.notAMemeber,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
