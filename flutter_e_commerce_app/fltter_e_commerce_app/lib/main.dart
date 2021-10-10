import 'package:fltter_e_commerce_app/screens/main_screen.dart';
import 'package:fltter_e_commerce_app/services/main_provider.dart';
import 'package:fltter_e_commerce_app/services/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((value) {
    var isLightTheme = value.getBool('isLightTheme') ?? false;

    runApp(
      MultiProvider(
        providers: [
          Provider<ThemesProvider>(
            create: (_) => ThemesProvider(isLigthTheme: isLightTheme),
          ),
          Provider<MainProvider>(create: (_) => MainProvider()),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemesProvider themesProvider =
        Provider.of<ThemesProvider>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themesProvider.getTheme,
      home: MainScreen(),
    );
  }
}
