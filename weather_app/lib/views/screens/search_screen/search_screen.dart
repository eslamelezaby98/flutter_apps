import 'package:flutter/material.dart';
import 'package:weather_app/helper/color_manager.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          //! add key for from
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
                  //! add controller
                  //! add on change method.
                  //! add validation => queen pub*
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
                  //! move to country which you searhed about.
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