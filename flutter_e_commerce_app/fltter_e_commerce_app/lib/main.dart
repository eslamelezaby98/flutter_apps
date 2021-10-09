import 'package:fltter_e_commerce_app/screens/home_screen.dart';
import 'package:fltter_e_commerce_app/screens/login_screen.dart';
import 'package:fltter_e_commerce_app/services/main_provider.dart';
import 'package:fltter_e_commerce_app/services/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((value) {
    var isLightTheme = value.getBool('isLightTheme') ?? false;

    runApp(
      MultiProvider(providers: [
        Provider<ThemesProvider>(
            create: (_) => ThemesProvider(isLigthTheme: isLightTheme)),
        Provider<MainProvider>(create: (_) => MainProvider()),
      ], child: MyApp()),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemesProvider themesProvider = Provider.of<ThemesProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themesProvider.getTheme,
      home: HomeScreen(),
    );
  }
}
