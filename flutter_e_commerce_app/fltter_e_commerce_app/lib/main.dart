import 'package:fltter_e_commerce_app/helpers/binding.dart';
import 'package:fltter_e_commerce_app/views/auth_screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      home: MaterialApp(
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
      ),
    );
  }
}
