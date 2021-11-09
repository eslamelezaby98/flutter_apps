import 'package:fltter_e_commerce_app/controllers/product_controller.dart';
import 'package:fltter_e_commerce_app/models/product_model.dart';
import 'package:fltter_e_commerce_app/views/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final ProductController productController = Get.find();
  final String numOFCartProducts = '4';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(() => PaymentScreen());
        },
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.red.shade500,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              'Checkout: 100 \$',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'MY CART',
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
      body: ListView.builder(
        itemCount: productController.productsCart.length,
        itemBuilder: (context, index) {
          return ProductCart(
            size: size,
            productsModel: productController.productsCart.keys.toList()[index],
          );
        },
      ),
    );
  }
}

class ProductCart extends StatelessWidget {
  const ProductCart({
    Key? key,
    required this.size,
    required this.productsModel,
  }) : super(key: key);

  final Size size;
  final ProductsModel productsModel;

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
                        productsModel.image,
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
                        productsModel.title,
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
                            '${productsModel.rating.rate}',
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
                      '${productsModel.price} \$',
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
