import 'package:e_commerce_app/constants/color.dart';
import 'package:e_commerce_app/core/binding.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    initialBinding: Binding(),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: Colors.white,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
