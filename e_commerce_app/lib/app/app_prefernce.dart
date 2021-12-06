import 'package:e_commerce_app/presentation/app_manager/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefernce {
  SharedPreferences sharedPreferences;
  AppPrefernce(this.sharedPreferences);

  static const lanaguageKey = 'lanaguageKey';
  Future<String> getAppLanaguge() async {
    String? language = sharedPreferences.getString(lanaguageKey);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // deafult lanaguge.
      return LaguageType.english.getValue();
    }
  }
}
