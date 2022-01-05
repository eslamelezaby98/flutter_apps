import 'package:e_commerce_fluter_app/data/dummy_data.dart/product_dummy_data.dart';
import 'package:e_commerce_fluter_app/helper/color_manager.dart';
import 'package:flutter/material.dart';

class ProductDetilasScreen extends StatelessWidget {
  const ProductDetilasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.secondColor,
        onPressed: () {
          //! add to cart
        },
        child:const Icon(Icons.shopping_bag_outlined),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width / 1.5,
                width: size.width,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/small_tilt_shoe_1.png',
                  ),
                ),
              ),
              //! product preview
              SizedBox(
                height: size.height / 10,
                child: Align(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: size.width / 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: ColorManager.secondColor,
                            ),
                          ),
                          child: const Image(
                            image: AssetImage('assets/shoe_thumb_1.png'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              //! product name and price and rate
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Nike Air Max 200',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Column(
                    children: [
                      Text(
                        '240.00 \$',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Row(
                        children: [
                          for (var i = 0; i < 5; i++)
                            const Icon(
                              Icons.star_border,
                              color: ColorManager.secondColor,
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Avaliabe Size',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              //! sizes
              SizedBox(
                height: size.height / 10,
                child: Align(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: size.width / 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: ColorManager.secondColor,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'US 7',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              //! colors
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Avaliabe Colors',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              //! colors
              SizedBox(
                height: size.height / 10,
                child: Align(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                  ),
                ),
              ),
              //! Decription
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Description',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  ProductdummyData.discription,
                  style: TextStyle(fontSize: 14, letterSpacing: 1, height: 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
