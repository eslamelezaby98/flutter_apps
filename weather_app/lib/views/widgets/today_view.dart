import 'package:flutter/material.dart';
import 'weather_tile_list.dart';

class TodayView extends StatelessWidget {
  const TodayView({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data!.forecast.forecastday[0].hour.length,
      itemBuilder: (context, index) {
        final forecast = snapshot.data!.forecast.forecastday[0];
        return WeatherListtile(
            conditionIcon: forecast.hour[index].condition.icon,
            conditionText: forecast.hour[index].condition.text,
            hour: forecast.hour[index].time);
      },
    );
  }
}