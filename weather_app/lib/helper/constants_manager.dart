import 'package:weather_app/keys.dart';

class ConstantsManager {
  //! Api consts
  

  static String getBaseUrlByCountry(String country) {
    String baseUrlByCountry =
        'https://api.weatherapi.com/v1/forecast.json?key=$myKey&q=$country&days=7&aqi=no&alerts=no';
       
    return baseUrlByCountry;
  }

  //! history model consts
  static const String history = 'history';

  //! Hive key
  static const int historyKypeKey = 0;
  static const int countryHiveIndex = 1;
}
