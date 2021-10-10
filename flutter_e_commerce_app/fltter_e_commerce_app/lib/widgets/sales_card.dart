import 'package:flutter/material.dart';

class SalesCard extends StatelessWidget {
  final Size size;
  final String imagePath;

  const SalesCard({required this.size, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 300,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}