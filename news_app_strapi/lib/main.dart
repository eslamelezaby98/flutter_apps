import 'package:flutter/material.dart';
import 'package:news_app_strapi/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      // theme: ThemeData(
      //   scaffoldBackgroundColor: Colors.white
      // ),
      home: HomeScreen(),
    );
  }
}
