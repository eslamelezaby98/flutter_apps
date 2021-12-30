import '../models/country_model.dart';
import '../services/network_services.dart';

class Repos {
  NetworkServices networkServices = NetworkServices();

 Future<Country?>? fetchWeatherByCountry(String country) {
    return networkServices.fetchWeatherByCountry(country);
  }
}
