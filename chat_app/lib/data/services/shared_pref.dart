import 'package:shared_preferences/shared_preferences.dart';
import 'package:chat_app/helper/constants_manager.dart';

class DBHelper {
  isUserLoggedIn(bool isLogged) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(ConstantsManager.loggedInKey, isLogged);
  }

  setUserName(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(ConstantsManager.userNameKey, userName);
  }

  setUserEmail(String userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(ConstantsManager.emailKey, userEmail);
  }

  getUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(ConstantsManager.loggedInKey);
  }

  getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(ConstantsManager.userNameKey);
  }

  getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(ConstantsManager.emailKey);
  }
}
