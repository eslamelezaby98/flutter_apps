import 'package:flutter/material.dart';
import 'package:weather_app/data/models/country_model.dart';
import 'package:weather_app/data/models/location_model.dart';
import 'package:weather_app/data/web_services/network_services.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  NetworkServices networkServices = NetworkServices();

  // @override
  // void initState() {
  //   super.initState();
  //   networkServices.fetchWeatherByCountry('Egypt');
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
        future: networkServices.fetchWeatherByCountry('London'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // icon
                SizedBox(
                  height: size.height / 6,
                  width: size.width / 4,
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
                          //! change view to hourly view
                        },
                        child: Text(
                          'Hourly',
                          style: Theme.of(context).textTheme.subtitle1,
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
                //? Hours
                Expanded(
                  //! will be dynamic
                  child: ListView.builder(
                    itemCount:
                        snapshot.data!.forecast.forecastday[0].hour.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            snapshot
                                .data!.forecast.forecastday[0].hour[index].time
                                .substring(11, 16),
                            // '01:00 PM',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(

                              'https:${snapshot.data!.forecast.forecastday[0].hour[index].condition.icon}',
                            ),
                          ),
                          Text(
                            snapshot.data!.forecast.forecastday[0].hour[index]
                                .condition.text,
                            // 'Clear',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator(color: Colors.black);
          }
        },
      ),
    );
  }
}
