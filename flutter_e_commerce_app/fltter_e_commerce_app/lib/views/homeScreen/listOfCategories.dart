import 'package:fltter_e_commerce_app/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height /15,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoriesCard(title: 'Top Deals'),
            CategoriesCard(title: 'Mobiles'),
            CategoriesCard(title: 'Home'),
            CategoriesCard(title: 'Fashion'),
            CategoriesCard(title: 'Computers'),
            CategoriesCard(title: 'COVID-19'),
          ],
        ),
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  final String title;
  const CategoriesCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: kLightColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black26),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
