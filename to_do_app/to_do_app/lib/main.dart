import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'package:to_do_app/services/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then(((value) {
    var isDarkTheme = value.getBool('isDarkTheme') ?? false;
    runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDarkTheme: isDarkTheme),
        child: MyApp(),
      ),
    );
  }));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getTheme,
      home: HomeScreen(),
    );
  }
}
