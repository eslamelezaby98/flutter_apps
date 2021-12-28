import 'package:weather_app/data/models/condition_model.dart';

class Current {
  Current({
    required this.lastUpdated,
    required this.condition,
  });

  final String lastUpdated;
  final Condition condition;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdated: json["last_updated"],
        condition: Condition.fromJson(json["condition"]),
      );
}