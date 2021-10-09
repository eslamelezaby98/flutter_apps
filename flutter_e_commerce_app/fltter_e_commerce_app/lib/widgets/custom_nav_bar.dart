import 'package:fltter_e_commerce_app/services/main_provider.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final activeColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          custom_button(
            icon: Icons.home_outlined,
          ),
          custom_button(
            icon: Icons.shopping_bag_outlined,
          ),
          custom_button(
            icon: Icons.account_circle_outlined,
          ),
        ],
      ),
    );
  }

  custom_button({required IconData icon}) {
    return Card(
      color: Colors.red,
      child: IconButton(
        onPressed: () {
          MainProvider().onTap(0);
        },
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
