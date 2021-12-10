import 'package:flutter/material.dart';
import 'package:news_app/app_manager/app_size_manager.dart';

class HomeViewModel extends ChangeNotifier {
  bool isCountryLabelActive = false;

  getCountryName(String countryName, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: InkWell(
        onTap: () {
          isCountryLabelActive = !isCountryLabelActive;
          notifyListeners();
          print('tap $countryName');
        },
        child: Text(
          countryName,
          style: isCountryLabelActive == true
              ? Theme.of(context).textTheme.bodyText1
              : Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
  
}
