import 'package:fltter_e_commerce_app/helpers/constants.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
      child: Container(
        height: size.height / 1,
        width: size.width,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ProductCard();
          },
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
        height: size.height / 2,
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
