import 'package:e_commerce_fluter_app/data/dummy_data.dart/product_dummy_data.dart';
import 'package:e_commerce_fluter_app/helper/color_manager.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 700,
        width: size.width / 2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorManager.secondColor,
              width: 2,
            )),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                onPressed: () {
                  //! add to fav
                },
                icon: const Icon(
                  Icons.favorite_border,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.orange.withOpacity(0.2),
                    ),
                    Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        ProductdummyData.products[index].image,
                      ),
                    ),
                  ],
                ),
                Text(
                  ProductdummyData.products[index].name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  ProductdummyData.products[index].category,
                  style: Theme.of(context).textTheme.caption,
                ),
                RichText(
                  textScaleFactor: 2.0,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: ProductdummyData.products[index].price.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: ' \$',
                        style: TextStyle(
                          color: ColorManager.secondColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}