import 'package:flutter/cupertino.dart';

class CountryModel extends ChangeNotifier {
  late String countryName;
  late String countryImageUrl;
  late String countryShortcutName;

  // String get countryName => _countryName;
  // set countryName(String countryName) => _countryName;

  // String get countryImageUrl => _countryImageUrl;
  // set countryImageUrl(String countryImageUrl) => _countryImageUrl;

  // CountryModel({
  //   required this.countryName,
  //   required this.countryImageUrl,
  //   required this.countryShortcutName,
  // });

  List<Map<String, dynamic>> countriesList = [
    {
      "name": "Egypt",
      "urlImage":
          "https://www.state.gov/wp-content/uploads/2019/04/Egypt-2109x1406.jpg",
      "shortcutName": "eg",
    },
    {
      "name": "United Status",
      "urlImage":
          "https://i0.wp.com/movingtips.wpengine.com/wp-content/uploads/2019/07/new-york2.jpg",
      "shortcutName": "us",
    },
    {
      "name": "India",
      "urlImage":
          "http://cdn.cnn.com/cnnnext/dam/assets/210328210341-taj-mahal.jpg",
      "shortcutName": "in",
    },
    {
      "name": "China",
      "urlImage":
          "https://cdn.theatlantic.com/thumbor/2MpINhoPDz7Z-u0Zu-nh2z2Pqi8=/0x0:2500x1406/1600x900/media/img/mt/2021/06/GettyImages_1233703218/original.jpg",
      "shortcutName": "ch",
    },
  ];

  // factory CountryModel.toList(Map<String, dynamic> data) {
  //   return CountryModel(
  //     countryName: data['name'],
  //     countryImageUrl: data['urlImage'],
  //     countryShortcutName: data['shortcutName'],
  //   );
  // // }

  // fetchCountryInfo(String countryName) {

  // }
}
