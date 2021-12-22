import 'package:chat_app/data/services/database_services.dart';
import 'package:flutter/cupertino.dart';

class DBController extends ChangeNotifier {
  DBServices dbServices = DBServices();
  TextEditingController messageController = TextEditingController();

  getCurrentUser() {
    dbServices.getCureentUser();
  }

  

  

  onChanage(String message) {
    message = messageController.text;
    notifyListeners();
  }

  addMessage() {
    dbServices.addMessage(messageController.text);
    notifyListeners();
  }
}
