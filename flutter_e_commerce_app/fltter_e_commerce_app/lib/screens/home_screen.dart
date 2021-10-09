import 'package:fltter_e_commerce_app/services/main_provider.dart';
import 'package:fltter_e_commerce_app/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
var mainProvider = Provider.of<MainProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50,
          child: TextField(
            style: TextStyle(
              color: ThemeData().hintColor,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              hintText: 'Search about what you want',
              prefixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
      body: mainProvider.screens.elementAt(mainProvider.selectedScreenIndex),
    );
  }
}
