import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({Key? key}) : super(key: key);

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
        title: const Text(
          //! country
          'Landon',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // icon
          SizedBox(
            height: size.height / 4,
            width: size.width / 4,
            child: const Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                //! weather icon today
                'https://cdn.weatherapi.com/weather/64x64/night/113.png',
              ),
            ),
          ),
          Text(
            'Clear',
            style: Theme.of(context).textTheme.headline1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                //! weather today
                '28',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                '°',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
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
          Expanded(
            //! will be dynamic
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '01:00 PM',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const Image(
                      image: NetworkImage(
                        'https://cdn.weatherapi.com/weather/64x64/night/113.png',
                      ),
                    ),
                    Text(
                      'Clear',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
