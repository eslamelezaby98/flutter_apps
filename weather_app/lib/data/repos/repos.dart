import 'package:weather_app/data/models/country_model.dart';
import 'package:weather_app/data/services/network_services.dart';

class Repos {
  NetworkServices networkServices = NetworkServices();

 Future<Country?>? fetchWeatherByCountry(String country) {
    return networkServices.fetchWeatherByCountry(country);
  }
}
