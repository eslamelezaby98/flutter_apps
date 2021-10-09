import 'package:fltter_e_commerce_app/services/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemesProvider themesProvider =
        Provider.of<ThemesProvider>(context, listen: false);
    return Scaffold(
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            snap: false,
            pinned: true,
            floating: false,
            title: Container(
              height: 50,
              child: TextField(
                style: TextStyle(
                  color: ThemeData().hintColor,
                ),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    hintText: 'Search about what you want',
                    prefixIcon: Icon(
                      Icons.search,
                      // color: ,
                    )),
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}
