import 'package:e_commerce_fluter_app/data/dummy_data.dart/product_dummy_data.dart';
import 'package:e_commerce_fluter_app/views/home_screen/category_widget.dart';
import 'package:e_commerce_fluter_app/views/home_screen/product_card_widget.dart';
import 'package:e_commerce_fluter_app/views/home_screen/search_widget.dart';
import 'package:e_commerce_fluter_app/views/widgets/screen_title_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        //! Search
        SliverAppBar(
          floating: true,
          pinned: true,
          leading: Container(),
          flexibleSpace: const SearchWidget(),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              buildScreenTitle(context,'Our',"Product"),
              //! category
              CategoriesWidget(size: size),
            ],
          ),
        ),
        //! product => category sneakers
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ProductCard(size: size, index: index);
            },
            childCount: ProductdummyData.products.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2 / 3,
          ),
        ),
      ],
    );
  }


}
