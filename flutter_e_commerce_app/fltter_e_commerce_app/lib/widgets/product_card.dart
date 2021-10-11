import 'package:fltter_e_commerce_app/helpers/constants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Container(
            height: 250,
            width: 200,
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(
                  'https://pngimg.com/uploads/iphone_13/iphone_13_PNG27.png',
                ),
              ),
            ),
            child: Stack(
              children: [
                // add to wish list
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black38,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Color(0xffEC981A),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            height: 50,
            color: kLightColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // title
                Text(
                  'iPhone 13',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // price
                Text(
                  '600 \$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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