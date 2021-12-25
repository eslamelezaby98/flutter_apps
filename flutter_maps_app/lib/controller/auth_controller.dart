import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  String dropdownValue = 'Egypt';
  List<String> conturies = ['Egypt', 'US', 'England'];
  String phoneNumber = '';
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  late String verificationId;

  onCountryChange(String? newValue) {
    dropdownValue = newValue!;
    notifyListeners();
  }

  onPhoneChange(String value) {
    value = phoneNumberController.text;
    notifyListeners();
  }

  onCodeChange(String value) {
    value = codeController.text;
    notifyListeners();
  }

  verifyPhoneNumber() async {
    try {
      var user = await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        timeout: const Duration(seconds: 40),
        codeAutoRetrievalTimeout: (String verificationId) {
          // print(verificationId);
        },
      );
      return user;
    } catch (e) {
      throw AssertionError(e);
    }
  }

  verificationCompleted(PhoneAuthCredential credential) async {
    await auth.signInWithCredential(credential);
    notifyListeners();
  }

  verificationFailed(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      throw AssertionError(e);
    }
    notifyListeners();
  }

  codeSent(String verificationId, int? resendToken) async {
    this.verificationId = verificationId;
    notifyListeners();
  }

  submitCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: codeController.text);

    await auth.signInWithCredential(credential);
    notifyListeners();
  }

  logout() {
    auth.signOut();
    notifyListeners();
  }

  getCurrentUser() {
    return auth.currentUser!;
  }
}
