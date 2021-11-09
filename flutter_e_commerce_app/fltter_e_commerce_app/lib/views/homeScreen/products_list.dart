// import 'package:fltter_e_commerce_app/controllers/product_controller.dart';
// import 'package:fltter_e_commerce_app/helpers/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ProductsList extends StatelessWidget {
//   final ProductController productController = Get.put(ProductController());

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height / 1,
//       width: size.width,
//       child: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Container(
//               width: size.width / 2,
//               height: size.height / 2,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(
//                   color: kSecondColor,
//                 ),
//               ),
//               child: Stack(
//                 children: [
//                   // product image
//                   Image(
//                     image: AssetImage('assets/products/product.png'),
//                   ),
//                   // products details
//                   Positioned(
//                     bottom: 0,
//                     width: size.width,
//                     child: Container(
//                       height: 120,
//                       color: Colors.red.shade100,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // product name
//                             Text(
//                               'Pierced Owl Rose Gold Plated Stainless Steel Double',
//                               maxLines: 1,
//                             ),
//                             SizedBox(height: 10),
//                             // rate
//                             Container(
//                               height: 30,
//                               width: 60,
//                               decoration: BoxDecoration(
//                                 color: Colors.red,
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.yellowAccent,
//                                     size: 15,
//                                   ),
//                                   Text(
//                                     '3.9',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyText1!
//                                         .copyWith(color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // price & add to cart
//                             Padding(
//                               padding: const EdgeInsets.only(right: 10),
//                               child: Container(
//                                 width: size.width,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       '109.95 \$',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyText1!
//                                           .copyWith(fontSize: 24),
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         // add to cart
//                                       },
//                                       child: Container(
//                                         height: 40,
//                                         width: 120,
//                                         child: Center(
//                                           child: Text(
//                                             'ADD TO CART',
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyText1!
//                                                 .copyWith(color: Colors.white),
//                                           ),
//                                         ),
//                                         decoration: BoxDecoration(
//                                           color: Colors.red,
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.favorite_border,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
