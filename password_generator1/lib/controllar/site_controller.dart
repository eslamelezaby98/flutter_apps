import 'package:get/get.dart';
import 'package:password_generator/models/site.dart';

class SiteController extends GetxController {
  var _siteList = {}.obs;

  preivewSite(Site site) {
    if (_siteList.containsKey(site)) {
      _siteList[site] += 1;
    } else {
      _siteList[site] = 1;
    }
    update();
  }

  get siteList => _siteList;
}
