import 'package:e_commerce_fluter_app/views/widgets/screen_title_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildScreenTitle(context, 'Shopping', "Cart"),
              IconButton(
                onPressed: () {
                  //! delete
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
