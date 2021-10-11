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
              style: GoogleFonts.openSans(
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
                'https://www.pngitem.com/pimgs/m/241-2413626_grocery-transparent-images-png-grocery-png-png-download.png',
          ),
          CategoriesCard(
            title: 'Fashion',
            imagePath:
                'https://images.click.in/classifieds/images/190/21_04_2017_12_38_52_2hkfjh9tsmnk3aqfrttef73vj6_86cefxiuhg.png',
          ),
          CategoriesCard(
            title: 'Mobiles',
            imagePath:
                'https://cdn.osxdaily.com/wp-content/uploads/2019/10/iphone-11-and-iphone-11-pro-line.jpg',
          ),
          CategoriesCard(
            title: 'Home',
            imagePath:
                'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/home-1633038782.jpg',
          ),
          CategoriesCard(
            title: 'Electorincs',
            imagePath:
                'https://www.seekpng.com/png/full/774-7744281_samsung-electronics-samsung-electronic-product-png.png',
          ),
          CategoriesCard(
            title: 'COVID-19',
            imagePath:
                'https://economictimes.indiatimes.com/thumb/msid-83134310,width-1200,height-900,resizemode-4,imgsize-474366/9.jpg',
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
                fit: BoxFit.cover,
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
