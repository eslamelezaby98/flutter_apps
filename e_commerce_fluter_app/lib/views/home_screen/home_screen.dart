import 'package:e_commerce_fluter_app/data/dummy_data.dart/category_dummy_data.dart';
import 'package:e_commerce_fluter_app/data/dummy_data.dart/product_dummy_data.dart';
import 'package:e_commerce_fluter_app/helper/color_manager.dart';
import 'package:e_commerce_fluter_app/views/home_screen/category_widget.dart';
import 'package:e_commerce_fluter_app/views/home_screen/my_drawer.dart';
import 'package:e_commerce_fluter_app/views/home_screen/product_card_widget.dart';
import 'package:e_commerce_fluter_app/views/home_screen/search_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentProductIndex = 0;
  dynamic selectedIndex = {};
  List<dynamic> products = const [
    {
      'title': 'Adidas Originals \nby Alexander Wang',
      'image':
          'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fGFkaWRhc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      'description': 'Limited collection'
    },
    {
      'title': 'Adidas Originals \nby Alexander Wang',
      'image':
          'https://images.unsplash.com/photo-1582588678413-dbf45f4823e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2265&q=80',
      'description': 'Limited collection'
    },
    {
      'title': 'Adidas Originals \nby Alexander Wang',
      'image':
          'https://images.unsplash.com/photo-1589188056053-28910dc61d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2264&q=80',
      'description': 'Limited collection'
    }
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://preview.keenthemes.com/metronic-v4/theme_rtl/assets/pages/media/profile/profile_user.jpg',
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchWidget(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'Products',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
          CategoriesWidget(size: size),
          Expanded(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              childAspectRatio: 2/3,
              children: List.generate(
                ProductdummyData.products.length,
                (index) => ProductCard(size: size, index: index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
