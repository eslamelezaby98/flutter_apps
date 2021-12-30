import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/data_provider/search_controller.dart';
import 'package:weather_app/data/models/history.dart';
import 'package:weather_app/helper/constants_manager.dart';
import 'package:weather_app/helper/routes_manager.dart';
import 'package:weather_app/helper/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HistroyAdapter());
  await Hive.openBox<Histroy>(ConstantsManager.history);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager().getTheme(),
        onGenerateRoute: GenerateRoutes().onGenerateRoutes,
        initialRoute: Routes.searchScreen,
      ),
    );
  }
}
