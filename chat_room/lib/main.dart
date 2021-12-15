import 'package:chat_room/controllers/auth_model_view.dart';
import 'package:chat_room/data/web_services/auth_service.dart';
import 'package:chat_room/helper/routes_manager.dart';
import 'package:chat_room/helper/theme_manager.dart';
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
        // ChangeNotifierProvider(
        //   create: (context) => AuthService(),
        // ),
        ChangeNotifierProvider(
          create: (context) => AuthModelView(),
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
