import 'package:flutter/material.dart';
import 'package:news_app/app_manager/app_size_manager.dart';

class HomeViewModel extends ChangeNotifier {
  bool isCountryLabelActive = false;

  getCountryName(String countryName, BuildContext context) {
    if (isCountryLabelActive == true) {
      return Padding(
        padding: const EdgeInsets.all(AppSize.s12),
        child: InkWell(
          onTap: () {
            isCountryLabelActive = true;
            notifyListeners();
            print('tap $countryName');
          },
          child: Text(
            countryName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          isCountryLabelActive = true;
          notifyListeners();
           print('tap $countryName');
        },
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s12),
          child: Text(
            countryName,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      );
    }
  }
}
