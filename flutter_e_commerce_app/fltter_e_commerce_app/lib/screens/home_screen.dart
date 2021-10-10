import 'package:fltter_e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // List of categories
        Container(
          height: 40,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoriesCard(),
                CategoriesCard(),
                CategoriesCard(),
                CategoriesCard(),
                CategoriesCard(),
                CategoriesCard(),
                CategoriesCard(),
                CategoriesCard(),
                CategoriesCard(),
                CategoriesCard(),
              ],
            ),
          ),
        ),
        // See What's New
        headerText(title: 'See What\'s New Today'),
        // list of new products
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 300,
            child: Row(
              children: [
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
              ],
            ),
          ),
        ),
        // See What's New
        headerText(title: 'Recommend For You'),
        // List of recommend products
        Column(
          children: [
            ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
          ],
        ),
      ],
    );
  }

  // Header Text
  Padding headerText({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Text(
        title,
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: 35,
        width: 70,
        child: Center(
          child: Text(
            'Top',
            style: TextStyle(
              color: Color(0xffE99844),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xffF8E8CE),
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
