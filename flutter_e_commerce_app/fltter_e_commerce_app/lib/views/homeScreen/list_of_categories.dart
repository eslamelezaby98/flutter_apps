import 'package:fltter_e_commerce_app/controllers/home_screen_controller.dart';
import 'package:fltter_e_commerce_app/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfCategories extends GetWidget<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
      child: Container(
          height: size.height / 15,
          color: Colors.white,
          child: ListView.builder(
            itemCount: controller.listOfCategoriesNames.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoriesCard(title: '${controller.listOfCategoriesNames[index]}');
            },
          )
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
            border: Border.all(color: Colors.red),
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
