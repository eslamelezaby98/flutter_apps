import 'package:fltter_e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ListOfTrendingProducts extends StatelessWidget {
  const ListOfTrendingProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height ,
      width: size.width,
      child: ListView(
        children: [
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
        ],
      ),
    );
  }
}
