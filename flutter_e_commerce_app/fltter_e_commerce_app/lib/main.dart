import 'package:fltter_e_commerce_app/helpers/binding.dart';
import 'package:fltter_e_commerce_app/views/AuthScreens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          color: Colors.white,
          titleTextStyle: GoogleFonts.openSans(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          actionsIconTheme: IconThemeData(
            color: kSecondColor,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kMainColor,
          unselectedItemColor: Colors.black26,
          selectedItemColor: kSecondColor,
        ),
        indicatorColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.openSans(
            color: Colors.black,
          ),
          bodyText2: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      home: AuthScreen(),
    );
  }
}
