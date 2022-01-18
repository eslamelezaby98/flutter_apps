import 'package:dio/dio.dart';

import '../../helper/constants_manager.dart';
import '../models/country_model.dart';

class NetworkServices {
  late Dio dio;

  NetworkServices() {
    BaseOptions baseOptions = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000,
    );
    dio = Dio(baseOptions);
  }

  Future<Country?>? fetchWeatherByCountry(String country) async {
    try {
      Response response =
          await dio.get(ConstantsManager.getBaseUrlByCountry(country));
      if (response.statusCode == 200) {
        final result = response.data;
        // print(result);
        var weatherOfCountry = Country.fromJson(result);
        // print(weatherOfCountry.location.country);
        return weatherOfCountry;
      } else {
        // print('Error and return null else');
        throw AssertionError();
      }
    } catch (e) {
      print('Error and return null catch ${e.toString()}');
      // throw AssertionError();
    }
  }
}
