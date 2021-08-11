import 'package:get/state_manager.dart';
import 'package:password_generator/constants/constants.dart';

class Site extends GetxController {
  int _id;
  String _siteName;
  String _lettersNums, _symbolsNums, _numbersNums;
  String _sitePassword;

 static int numbersOfSites = 0;

  Site(dynamic map) {
    _id = map[kId];
    _siteName = map[kSiteName];
    _lettersNums = map[kLettersNums];
    _symbolsNums = map[kSymbolsNums];
    _numbersNums = map[kNumbersNums];
    _sitePassword = map[kSitePassword];
    numbersOfSites++;
  }

  int get id => _id;
  String get siteName => _siteName;
  String get lettersNums => _lettersNums;
  String get symbolsNums => _symbolsNums;
  String get numbersNums => _numbersNums;
  String get sitePassword => _sitePassword;

  set id(int newId) {
    this._id = newId;
  }

  set siteName(String newSiteNme) {
    this._siteName = newSiteNme;
  }

  set lettersNums(String newLettersNums) {
    this._lettersNums = newLettersNums;
  }

  set symbolsNums(String newSymbolsNums) {
    this._symbolsNums = newSymbolsNums;
  }

  set numbersNums(String newNumbersNums) {
    this._numbersNums = newNumbersNums;
  }

  set sitePassword(String newPassword) {
    this._sitePassword = newPassword;
  }

  // convert into map
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (_id != null) {
      map[kId] = _id;
    }
    map[kSiteName] = _siteName;
    map[kLettersNums] = _lettersNums;
    map[kSymbolsNums] = _symbolsNums;
    map[kNumbersNums] = _numbersNums;
    if (_sitePassword != null) {
      map[kSitePassword] = _sitePassword;
    }
    return map;
  }

  // Extract from a map object
  Site.fromMap(Map<String, dynamic> map) {
    _id = map[kId];
    _siteName = map[kSiteName];
    _lettersNums = map[kLettersNums];
    _symbolsNums = map[kSymbolsNums];
    _numbersNums = map[kNumbersNums];
    _sitePassword = map[sitePassword];
  }
}
