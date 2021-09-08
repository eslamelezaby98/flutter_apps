import 'package:e_commerce_app/constants/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double buttonSize;
  final Function onPress;

  const CustomButton({
    this.title,
    this.onPress,
    this.buttonSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: kPrimaryColor,
        fixedSize: Size.fromWidth(
          buttonSize,
        ),
        side: BorderSide(
          color: Colors.black38,
        ),
      ),
    );
  }
}
