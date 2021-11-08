import 'package:fltter_e_commerce_app/helpers/constants.dart';
import 'package:flutter/material.dart';

class ListOfProducts extends StatelessWidget {
  const ListOfProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
      
      child: Container(
        height: size.height /1 ,
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
      ),
    );
  }
}


class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width / 2,
        height: size.height /2,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: kSecondColor,
          ),
        ),
        child: Column(
          children: [
            // product image
            Image(
              image: AssetImage('assets/products/product.png'),
            ),
             
            // products details
          ],
        ),
      ),
    );
  }
}
