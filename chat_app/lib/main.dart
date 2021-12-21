import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/controller/db_controller.dart';
import 'package:chat_app/helper/routes_manager.dart';
import 'package:chat_app/helper/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DBController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.getDarkTheme(),
        onGenerateRoute: RoutesGenerator.generateRoute,
        initialRoute: Routes.registerScreen,
      ),
    );
  }
}
