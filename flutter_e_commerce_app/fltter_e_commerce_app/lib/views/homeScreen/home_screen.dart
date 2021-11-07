import 'package:fltter_e_commerce_app/views/homeScreen/listOfCategories.dart';
import 'package:fltter_e_commerce_app/views/homeScreen/listOfTrendingProducts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mesh Amazon'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListOfCategories(),
          ListOfTrendingProducts(),
        ],
      ),
    );
  }
}
