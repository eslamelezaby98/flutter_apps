import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/data_provider/search_controller.dart';
import '../../../data/models/history.dart';
import '../../../data/services/hive_boxes.dart';
import '../../../helper/color_manager.dart';
import '../../../helper/routes_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  Future addToHistory(String countryName) async {
    final history = Histroy()..countryName = countryName;
    final box = Boxes.getHistory();
    await box.add(history);
  }

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.historyScreen);
            },
            icon: const Icon(
              Icons.history,
            ),
          ),
        ],
      ),
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
                  await addToHistory(searchProvider.searchController.text);
                  
                  Navigator.pushNamed(
                    context,
                    Routes.countryScreen,
                    arguments: searchProvider.searchController.text,
                  );
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
          ],
        ),
      ),
    );
  }
}
