import 'package:chat_room/data/web_services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthModelView extends ChangeNotifier {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  AuthService authService = AuthService();
  final formKey = GlobalKey<FormState>();

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
      authService.createUserWithEmailAndPassword(
        emailTextController.text,
        passwordTextController.text,
      );
    }
  }

  Future<UserCredential> signInWithGoogle() {
    return authService.signInWithGoogle();
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
