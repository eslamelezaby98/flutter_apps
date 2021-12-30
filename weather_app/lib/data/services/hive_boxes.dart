import 'package:hive/hive.dart';
import 'package:weather_app/data/models/history.dart';
import 'package:weather_app/helper/constants_manager.dart';

class Boxes {
  static Box<Histroy> getHistory() =>
      Hive.box<Histroy>(ConstantsManager.history);
}
