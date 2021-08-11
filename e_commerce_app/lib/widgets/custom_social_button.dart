import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color buttonColor;
  final Function onTap;

  const CustomSocialButton({
    this.imagePath,
    this.title,
    this.buttonColor,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.black38),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(
                imagePath,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
