import 'package:flutter/material.dart';

class WeatherListtile extends StatelessWidget {
  const WeatherListtile({
    Key? key,
    required this.conditionIcon,
    required this.conditionText,
    required this.hour,
  }) : super(key: key);
  final String hour;
  final String conditionIcon;
  final String conditionText;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        hour.substring(11, 16),
        style: Theme.of(context).textTheme.headline4,
      ),
      trailing: Image(
        fit: BoxFit.cover,
        image: NetworkImage(
          'https:$conditionIcon',
        ),
      ),
      subtitle: Text(
        conditionText,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}