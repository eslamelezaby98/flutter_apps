class ConstantsManager {
  //! Api consts
  //TODO: put here your key
  static const String myKey = ' put here your key';
  static const String country = 'Londen';
  static const String baseUrl =
      'http://api.weatherapi.com/v1/forecast.json?key=$myKey&q=$country&days=10&aqi=no&alerts=no';

  static String getBaseUrlByCountry(String country) {
    String baseUrlByCountry =
        'http://api.weatherapi.com/v1/forecast.json?key=$myKey&q=$country&days=10&aqi=no&alerts=no';
    return baseUrlByCountry;
  }

  //! history model consts
  static const String history = 'history';

  //! Hive key
  static const int historyKypeKey = 0;
  static const int countryHiveIndex = 1;
}
