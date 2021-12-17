import 'package:chat_room/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MessageController extends ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    return users
        .add({'name': 'ahmed'})
        .then((value) => print("user added"))
        .catchError((error) => 'Failed to add user: $error');
    
  }
}
