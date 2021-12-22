import 'package:chat_app/helper/constants_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DBServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User? loggedUser;
  final firestore = FirebaseFirestore.instance;

  uploadUserInfo(Map<String, String> userData) {
    firestore.collection(ConstantsManager.users).add(userData);
  }

  getCureentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedUser = user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  getUserByUserName(String userName) async {
    return await firestore
        .collection(ConstantsManager.users)
        .where(ConstantsManager.userName, isEqualTo: userName)
        .get();
  }

  addMessage(String message) async {
    await firestore.collection(ConstantsManager.messages).add({
      ConstantsManager.text: message,
      ConstantsManager.sender: loggedUser!.email
    });
  }
}
