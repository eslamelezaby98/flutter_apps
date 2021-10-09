import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/services/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            themeProvider.switchTheme();
            print('Change the theme');
          },
          icon: Icon(
            Icons.brightness_3_outlined,
          ),
        ),
        title: Text(
          'Home Screen',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            'Text',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}
