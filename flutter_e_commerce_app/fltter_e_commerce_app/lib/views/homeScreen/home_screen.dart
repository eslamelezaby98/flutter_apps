import 'package:fltter_e_commerce_app/controllers/product_controller.dart';
import 'package:fltter_e_commerce_app/helpers/constants.dart';
import 'package:fltter_e_commerce_app/models/product_model.dart';
import 'package:fltter_e_commerce_app/views/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mesh Amazon'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            color: Colors.red,
          ),
        ),
      ),
      body: Obx(
        () {
          if (productController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              height: size.height / 1,
              width: size.width,
              child: ListView.builder(
                itemCount: productController.productsList.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    size: size,
                    productsModel: productController.productsList[index],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Size size;
  final ProductsModel productsModel;

  ProductCard({
    required this.size,
    required this.productsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: size.width / 2,
        height: size.height / 2,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: kSecondColor,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image(
                image: NetworkImage(productsModel.image),
              ),
            ),
            // products details
            Positioned(
              bottom: 0,
              width: size.width,
              child: Container(
                height: 120,
                color: Colors.red.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsModel.title,
                        maxLines: 1,
                      ),
                      SizedBox(height: 10),
                      ProductRating(productsModel: productsModel),
                      PriceAndAddToCart(
                        size: size,
                        productsModel: productsModel,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                // add to favorite products
              },
              icon: Icon(
                Icons.favorite_border,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductRating extends StatelessWidget {
  const ProductRating({
    required this.productsModel,
  });

  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.star,
            color: Colors.yellowAccent,
            size: 15,
          ),
          Text(
            '${productsModel.rating.rate}',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class PriceAndAddToCart extends StatelessWidget {
  PriceAndAddToCart({
    required this.size,
    required this.productsModel,
  });

  final Size size;
  final ProductsModel productsModel;
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${productsModel.price} \$',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 24),
            ),
            InkWell(
              onTap: () async {
                await productController.addProductToCart(productsModel);
                Get.to(() => CartScreen());
              },
              child: Container(
                height: 40,
                width: 120,
                child: Center(
                  child: Text(
                    'ADD TO CART',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
