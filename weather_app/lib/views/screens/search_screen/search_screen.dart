import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/data_provider.dart';
import 'package:weather_app/helper/color_manager.dart';
import 'package:weather_app/helper/routes_manager.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchController>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: searchProvider.searchHomeKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Weather App',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchProvider.searchController,
                  onChanged: searchProvider.onSearchChange,
                  validator: searchProvider.validationSearch,
                  decoration: const InputDecoration(
                    hintText: 'Searching....',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    suffixIcon: Icon(
                      Icons.highlight_remove,
                    ),
                  ),
                  style: const TextStyle(color: ColorManager.white),
                  autofocus: true,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.countryScreen,
                    arguments: searchProvider.fetchWeatherBuCountry(),
                  );
                },
                child: const Text(
                  'Search',
                ),
                color: ColorManager.buttonColor,
                minWidth: 150,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
