import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/data_provider/search_controller.dart';
import 'package:weather_app/data/models/history_model.dart';
import 'package:weather_app/data/services/local_services.dart';
import 'package:weather_app/helper/color_manager.dart';
import 'package:weather_app/helper/routes_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final dbHelper = HistroyDB.instance;

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchController>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: searchProvider.searchHomeKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Weather App',
                style: Theme.of(context).textTheme.headline1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchProvider.searchController,
                  onChanged: searchProvider.onSearchChange,
                  validator: searchProvider.validationSearch,
                  decoration: InputDecoration(
                      hintText: 'Searching....',
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          searchProvider.searchController.clear();
                        },
                        icon: const Icon(
                          Icons.highlight_remove,
                        ),
                      )),
                  style: const TextStyle(color: ColorManager.white),
                  autofocus: true,
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  if (searchProvider.searchHomeKey.currentState!.validate()) {
                    Histroy histroy = Histroy(
                        countryName: searchProvider.searchController.text);
                    final historyRow = await dbHelper.insert({
                      dbHelper.countryName: searchProvider.searchController.text
                    });
                    print('insert history : $historyRow');
                    Navigator.pushNamed(context, Routes.countryScreen);
                  } else {
                    return;
                  }
                },
                child: const Text(
                  'Search',
                ),
                color: ColorManager.secondColor,
                minWidth: 150,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Egypt',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
