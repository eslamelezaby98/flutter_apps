import 'package:fltter_e_commerce_app/screens/categories_widgets/top_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // List of categories
        // Container(
        //   height: 40,
        //   child: SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         CategoriesCard(
        //           title: 'Top',
        //           onTap: () {
                  
        //           },
        //         ),
        //         CategoriesCard(
        //           title: 'Supermarket',
        //           onTap: () {
                  
        //           },
        //         ),
        //         CategoriesCard(
        //           title: 'Fashion',
        //           onTap: () {
                  
        //           },
        //         ),
        //         CategoriesCard(
        //           title: 'Mobiles',
        //           onTap: () {
                  
        //           },
        //         ),
        //         CategoriesCard(
        //           title: 'Home',
        //           onTap: () {
                  
        //           },
        //         ),
        //         CategoriesCard(
        //           title: 'Beauty',
        //           onTap: () {
                  
        //           },
        //         ),
        //         CategoriesCard(
        //           title: 'Electroics',
        //           onTap: () {
                  
        //           },
        //         ),
        //         CategoriesCard(
        //           title: 'COVID-19',
        //           onTap: () {
                  
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        //
        TopCategories(),
       
      ],
    );
  }
}
