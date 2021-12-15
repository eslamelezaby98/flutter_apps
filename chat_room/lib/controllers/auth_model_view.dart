import 'package:chat_room/data/web_services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthModelView extends ChangeNotifier {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  AuthService authService = AuthService();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  onEmailChange(String value) {
    value = emailTextController.text;
    notifyListeners();
  }

  onPasswordChange(String value) {
    value = passwordTextController.text;
    notifyListeners();
  }

  createUserWithEmailAndPassword() {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      authService.createUserWithEmailAndPassword(
        emailTextController.text,
        passwordTextController.text,
      );
    } else {
      return null;
    }
  }

  Future<UserCredential> signInWithGoogle() {
    return authService.signInWithGoogle();
  }
}
