import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey registerFormKey = GlobalKey<FormState>();
  GlobalKey signInFormKey = GlobalKey<FormState>();

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
