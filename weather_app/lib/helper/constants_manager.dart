class ConstantsManager {
  //TODO: remove my key
  static const String myKey = 'f77956a1f962403a81a195329212712';
  static const String country = 'Londen';
  static const String baseUrl =
      'http://api.weatherapi.com/v1/forecast.json?key=$myKey&q=$country&days=10&aqi=no&alerts=no';

  static String getBaseUrlByCountry(String country) {
   String baseUrlByCountry =
        'http://api.weatherapi.com/v1/forecast.json?key=$myKey&q=$country&days=10&aqi=no&alerts=no';
    return baseUrlByCountry;
  }
}