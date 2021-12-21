import 'package:chat_app/data/services/auth_services.dart';
import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final registerFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();
  AuthServices authServices = AuthServices();

  onEmailChange(String value) {
    value = emailController.text;
    notifyListeners();
  }

  onPasswordChange(String value) {
    value = passwordController.text;
    notifyListeners();
  }

  @override
  dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

 
  String? valiatorEmail(value) {
    if (value.isEmpty) {
      return 'Required';
    }
  }

  String? valiatorpassword(value) {
    if (value.isEmpty) {
      return 'Required';
    } else if (value.length <= 6) {
      return 'Password must be at least 6 elements';
    }
  }

  createUserWithEmailAndPassword() async {
    if (registerFormKey.currentState!.validate()) {
      return await authServices.createUserWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } else {
      return null;
    }
  }

  signInWithEmailAndPassword() async {
    if (signInFormKey.currentState!.validate()) {
      return await authServices.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    }
  }
}
