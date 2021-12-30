import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/data_provider/search_controller.dart';
import '../../../data/models/country_model.dart';
import '../../widgets/daily_view.dart';
import '../../widgets/today_view.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key,required this.countryName}) : super(key: key);
  final String countryName;
  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<SearchController>(context, listen: false);
    final PageController controller = PageController(initialPage: currentIndex);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<Country?>(
        future: provider.fetchWeatherByCountry(widget.countryName),
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
                      Text(
                        'Today',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        'Daily',
                        style: currentIndex == 1
                            ? Theme.of(context).textTheme.subtitle1
                            : Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
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
