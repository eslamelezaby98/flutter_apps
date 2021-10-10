import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
            child: Text(
              'Shopping on Categories',
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          // Categories
          CategoriesCard(
            title: 'Top Deals',
            imagePath:
                'https://itconsultingonline.net/wp-content/uploads/2018/11/merchant-center-magento.png',
          ),
          CategoriesCard(
            title: 'Supermarket',
            imagePath:
                'https://itconsultingonline.net/wp-content/uploads/2018/11/merchant-center-magento.png',
          ),
          CategoriesCard(
            title: 'Fashion',
            imagePath:
                'https://itconsultingonline.net/wp-content/uploads/2018/11/merchant-center-magento.png',
          ),
          CategoriesCard(
            title: 'TMobiles',
            imagePath:
                'https://itconsultingonline.net/wp-content/uploads/2018/11/merchant-center-magento.png',
          ),
          CategoriesCard(
            title: 'Home',
            imagePath:
                'https://itconsultingonline.net/wp-content/uploads/2018/11/merchant-center-magento.png',
          ),
          CategoriesCard(
            title: 'Electorincs',
            imagePath:
                'https://itconsultingonline.net/wp-content/uploads/2018/11/merchant-center-magento.png',
          ),
          CategoriesCard(
            title: 'COVID-19',
            imagePath:
                'https://itconsultingonline.net/wp-content/uploads/2018/11/merchant-center-magento.png',
          ),
        ],
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoriesCard({required this.title, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 200,
            width: size.width,
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(
                  imagePath,
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: 50,
            color: Color(0xffF8E8CE),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // title
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
