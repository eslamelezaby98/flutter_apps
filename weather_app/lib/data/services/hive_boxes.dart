import 'package:hive/hive.dart';
import '../models/history.dart';
import '../../helper/constants_manager.dart';

class Boxes {
  static Box<Histroy> getHistory() =>
      Hive.box<Histroy>(ConstantsManager.history);
}
