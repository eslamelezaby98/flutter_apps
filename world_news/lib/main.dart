import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/theme_controller.dart';
import 'helper/router_manager.dart';
import 'helper/theme_app_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeController(),
          ),
        ],
        builder: (context, child) {
          var provider = Provider.of<ThemeController>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: provider.isDark
                ? ThemeAppManager.getAppTheme()
                : ThemeAppManager.getLightTheme(),
            // themeMode: ThemeMode.dark,
            onGenerateRoute: RoutesGenerator().generateRoutes,
            initialRoute: Routes.mainSreen,
          );
        });
  }
}
