import 'package:flutter/material.dart';
import '../../helper/color_manager.dart';
import 'weather_tile_list.dart';

class DailyView extends StatelessWidget {
  const DailyView({
    Key? key,
    required this.size,
    required this.snapshot,
  }) : super(key: key);

  final Size size;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data!.forecast.forecastday.length,
      itemBuilder: (context, index) {
        var forecastday = snapshot.data!.forecast.forecastday[index];
        var data = forecastday.date.toString().substring(0, 10);
        return ListTile(
          title: Text(
            forecastday.date.toString().substring(0, 10),
            style: Theme.of(context).textTheme.headline4,
          ),
          subtitle: Text(
            forecastday.day.condition.text,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          trailing: Image(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https:${forecastday.day.condition.icon}',
            ),
          ),
          onTap: () {
            Scaffold.of(context).showBottomSheet((context) {
              return Container(
                height: size.height / 1.5,
                width: size.width,
                color: ColorManager.lightBlack,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data,
                              style: Theme.of(context).textTheme.headline4),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.cancel, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: forecastday.hour.length,
                        itemBuilder: (context, index) {
                          return WeatherListtile(
                            conditionIcon:
                                forecastday.hour[index].condition.icon,
                            conditionText:
                                forecastday.hour[index].condition.text,
                            hour: forecastday.hour[index].time,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            });
          },
        );
      },
    );
  }
}
