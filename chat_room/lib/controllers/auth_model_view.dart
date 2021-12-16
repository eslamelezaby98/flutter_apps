import 'package:chat_room/data/web_services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthModelView extends ChangeNotifier {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  AuthService authService = AuthService();
  final formRegisterScreenKey = GlobalKey<FormState>();
  final formSignInKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
  }

  onEmailChange(String value) {
    value = emailTextController.text;
    notifyListeners();
  }

  onPasswordChange(String value) {
    value = passwordTextController.text;
    notifyListeners();
  }

  createUserWithEmailAndPassword() async {
    if (formRegisterScreenKey.currentState!.validate()) {
      return await authService.createUserWithEmailAndPassword(
        emailTextController.text,
        passwordTextController.text,
      );
    } else {
      return null;
    }
  }

  signInWithEmailAndPassword() async {
    if (formSignInKey.currentState!.validate()) {
      return await authService.signInWithEmailAndPassword(
        emailTextController.text,
        passwordTextController.text,
      );
    } else {
      return null;
    }
  }

  void signInWithGoogle() async {
    authService.signInWithGoogle();
  }

  String error = 'Email is empty!';

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
}
