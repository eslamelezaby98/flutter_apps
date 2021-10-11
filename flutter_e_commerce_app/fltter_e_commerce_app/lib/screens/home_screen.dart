import 'package:fltter_e_commerce_app/widgets/product_card.dart';
import 'package:fltter_e_commerce_app/widgets/sales_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                borderSide: BorderSide(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(50),
              ),
              hintText: 'Search',
              prefixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories
            Container(
              height: 50,
              // color: Colors.red,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoriesTap(
                      title: 'Top Deals',
                    ),
                    CategoriesTap(
                      title: 'Mobiles',
                    ),
                    CategoriesTap(
                      title: 'Home',
                    ),
                    CategoriesTap(
                      title: 'Fashion',
                    ),
                    CategoriesTap(title: 'Computers'),
                    CategoriesTap(
                      title: 'COVID-19',
                    ),
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
            // Big Slaes Card
            SalesCard(
              size: size,
              imagePath: 'assets/images/sales.jpg',
            ),
            headerText(title: 'Check Big Slaes On Black Friday'),
            SalesCard(
              size: size,
              imagePath: 'assets/images/black friday.jpg',
            ),
          ],
        ),
      ),
    );
  }

  // Header Text
  Padding headerText({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Text(
        title,
        style: GoogleFonts.openSans(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}

class CategoriesTap extends StatelessWidget {
  final String title;

  const CategoriesTap({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: Color(0xffF8E8CE),
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
    );
  }
}
