import 'package:flutter/material.dart';
import 'package:weather_app/helper/constants_manager.dart';

class SearchController extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  final searchHomeKey = GlobalKey<FormState>();

  onSearchChange(String newValue) {
    newValue = searchController.text;
    notifyListeners();
  }

  String? validationSearch(value) {
    if (value.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  String? fetchWeatherBuCountry() {
    if (searchHomeKey.currentState!.validate()) {
      String country =
          ConstantsManager.getBaseUrlByCountry(searchController.text);
      // print(country);
      return country;
    } else {
      return null;
    }
  }
}
