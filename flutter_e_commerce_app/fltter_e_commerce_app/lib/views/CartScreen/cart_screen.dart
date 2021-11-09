import 'package:fltter_e_commerce_app/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
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
            Icons.arrow_back_ios_new_outlined,
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
      body: Obx(
        () {
          if (productController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: productController.productInCart.value,
              itemBuilder: (context, index) {
                return ProdctInCart(

                );
              },
            );
          }
        },
      ),
    );
  }


} 
class ProdctInCart extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('')
      ],
    );
  }
}
