import 'package:weather_app/data/models/forecast_model.dart';
import 'package:weather_app/data/models/location_model.dart';
import 'package:weather_app/data/models/today_model.dart';

class Country {
  Country({
    required this.location,
    required this.current,
    required this.forecast,
  });

  final Location location;
  final Current current;
  final Forecast forecast;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
      );
}









