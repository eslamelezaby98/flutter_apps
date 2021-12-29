import 'package:flutter/material.dart';
import 'package:weather_app/data/models/country_model.dart';
import 'package:weather_app/data/repos/repos.dart';

class SearchController extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  final searchHomeKey = GlobalKey<FormState>();
  Repos repos = Repos();

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

  @override
  dispose() {
    super.dispose();
    searchController.dispose();
  }

  Future<Country?>? fetchWeatherByCountry() {
    return repos.fetchWeatherByCountry(searchController.text);
  }
}
