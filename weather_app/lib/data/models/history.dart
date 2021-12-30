import 'package:hive/hive.dart';
import '../../helper/constants_manager.dart';
part 'history.g.dart';

@HiveType(typeId: ConstantsManager.historyKypeKey)
class Histroy extends HiveObject{

  @HiveField(ConstantsManager.countryHiveIndex)
  late String countryName;
}
