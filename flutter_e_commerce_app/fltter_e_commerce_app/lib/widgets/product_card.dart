import 'package:fltter_e_commerce_app/helpers/constants.dart';
import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       width: 210,
//       child: Column(
//         children: [
//           Container(
//             height: 250,
//             width: 200,
//             decoration: BoxDecoration(
//               color: Color(0xffE8E8E8),
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                 image: NetworkImage(
//                   'https://pngimg.com/uploads/iphone_13/iphone_13_PNG27.png',
//                 ),
//               ),
//             ),
//             child: Stack(
//               children: [
//                 // add to wish list
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.favorite_border_outlined,
//                     color: Colors.red,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 5),
//           Container(
//             width: 200,
//             height: 50,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 // title
//                 Text(
//                   'iPhone 13',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 // price
//                 Text(
//                   '600 \$',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: size.width / 2,
//         height: size.height /2,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//             color: kSecondColor,
//           ),
//         ),
//         child: Column(
//           children: [
//             // product image
//             Image(
//               image: AssetImage('assets/products/product.png'),
//             ),
             
//             // products details
//           ],
//         ),
//       ),
//     );
//   }
// }
