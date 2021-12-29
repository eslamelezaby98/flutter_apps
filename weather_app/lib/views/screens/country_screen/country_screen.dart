import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/data_provider/search_controller.dart';
import 'package:weather_app/data/models/country_model.dart';
import 'package:weather_app/helper/color_manager.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  // List<Widget> widgets = [
  //   TodayView(snapshot: snapshot),
  //   DailyView(size: size, snapshot: snapshot),
  // ];
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<SearchController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //! Search
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: FutureBuilder<Country?>(
        future: provider.fetchWeatherByCountry(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // icon
                SizedBox(
                  height: size.height / 6,
                  width: size.width / 3,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      //? weather icon
                      'https:${snapshot.data!.current.condition.icon}',
                    ),
                  ),
                ),
                Text(
                  //? country name
                  snapshot.data!.location.name,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  //? conditoon
                  snapshot.data!.current.condition.text,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  // color: Colors.white,
                  width: size.width,
                  height: size.height / 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          //! change view to today view ( the default).
                        },
                        child: const Text(
                          'Today',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //! change view to daily view
                        },
                        child: Text(
                          'Daily',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      TodayView(snapshot: snapshot),
                      DailyView(size: size, snapshot: snapshot),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        },
      ),
    );
  }
}

class TodayView extends StatelessWidget {
  const TodayView({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: snapshot.data!.forecast.forecastday[0].hour.length,
        itemBuilder: (context, index) {
          final forecast = snapshot.data!.forecast.forecastday[0];
          return WeatherListtile(
              conditionIcon: forecast.hour[index].condition.icon,
              conditionText: forecast.hour[index].condition.text,
              hour: forecast.hour[index].time);
        },
      ),
    );
  }
}

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
    return Expanded(
      child: ListView.builder(
        itemCount: snapshot.data!.forecast.forecastday.length,
        itemBuilder: (context, index) {
          var forecastday = snapshot.data!.forecast.forecastday[index];
          var data = forecastday.date.toString().substring(0, 10);
          return ListTile(
            title: Text(
              forecastday.date.toString().substring(0, 10),
            ),
            subtitle: Text(
                snapshot.data!.forecast.forecastday[index].day.condition.text),
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
                  color: ColorManager.buttonColor,
                  child: Column(
                    children: [
                      //! top of bottom sheet
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data,
                                style: Theme.of(context).textTheme.bodyText1),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon:
                                  const Icon(Icons.cancel, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      //! hours of days
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
      ),
    );
  }
}

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
        style: Theme.of(context).textTheme.headline3,
      ),
      trailing: Image(
        fit: BoxFit.cover,
        image: NetworkImage(
          'https:$conditionIcon',
        ),
      ),
      subtitle: Text(
        conditionText,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
