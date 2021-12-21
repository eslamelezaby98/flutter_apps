import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  

  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AssertionError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AssertionError('The account already exists for that email.');
      }
    } catch (e) {
      throw AssertionError(e.toString());
    }
    return null;
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AssertionError(e.toString());
      } else if (e.code == 'wrong-password') {
        throw AssertionError(e.toString());
      }
    }
    return null;
  }
}
