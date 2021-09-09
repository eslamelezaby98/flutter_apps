import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password;

 Rx<User> _user = Rx<User>();
  String get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

// sign in with email and password
 void signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.off(HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

// sign in wih Google
  void signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    print(googleUser);

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    var user = await _auth.signInWithCredential(credential);
    Get.off(HomeScreen());
  }

// sign in with Facebook
  void signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    print(loginResult);

    if (loginResult.status == LoginStatus.success) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken.token);

      // Once signed in, return the UserCredential
      var user = await _auth.signInWithCredential(facebookAuthCredential);
      print(user);
      Get.off(HomeScreen());
    }
  }
}
