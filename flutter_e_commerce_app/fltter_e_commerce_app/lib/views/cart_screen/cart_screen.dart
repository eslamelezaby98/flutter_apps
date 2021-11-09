import 'package:fltter_e_commerce_app/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final String numOFCartProducts = '4';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY CART',
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.payment,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Go to favorites products screen.
            },
            icon: Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ProductCart(size: size);
            },
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height / 10,
              width: size.width,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCart extends StatelessWidget {
  const ProductCart({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        height: size.height / 5,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.red),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                // product image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height / 4,
                    width: size.width / 2.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image(
                      image: NetworkImage(
                        'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // product title
                    Container(
                      width: size.width / 2,
                      child: Text(
                        'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    // product rate
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 15,
                          ),
                          Text(
                            '3.2',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                    // Price
                    Text(
                      '${115} \$',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),
            // delete button
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
