import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  final Function()? onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: onPress,
          iconSize: 30,
          icon: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}