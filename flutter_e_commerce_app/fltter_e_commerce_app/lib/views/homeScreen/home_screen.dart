import 'package:fltter_e_commerce_app/views/homeScreen/categories.dart';
import 'package:fltter_e_commerce_app/views/homeScreen/products.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
      body: Stack(
        children: [
          ProductsList(),
          ListOfCategories(),
        ],
      ),
    );
  }
}
