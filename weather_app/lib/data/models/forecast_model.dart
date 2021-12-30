
import 'condition_model.dart';

class Forecast {
  Forecast({
    required this.forecastday,
  });

  final List<Forecastday> forecastday;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: List<Forecastday>.from(
            json["forecastday"].map((x) => Forecastday.fromJson(x))),
      );
}

class Forecastday {
  Forecastday({
    required this.date,
    required this.day,
    required this.hour,
  });

  final DateTime date;
  final Day day;
  final List<Hour> hour;

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: DateTime.parse(json["date"]),
        day: Day.fromJson(json["day"]),
        hour: List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
      );
}

class Day {
  Day({
    required this.condition,
  });

  final Condition condition;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        condition: Condition.fromJson(json["condition"]),
      );
}

class Hour {
  Hour({
    required this.time,
    required this.condition,
  });
  final String time;
  final Condition condition;

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        time: json["time"],
        condition: Condition.fromJson(json["condition"]),
      );
}