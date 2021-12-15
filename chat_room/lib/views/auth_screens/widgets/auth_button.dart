import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Size size;
  final String title;
  final String imagePath;
  final Function onTap;
  const AuthButton({
    Key? key,
    required this.size,
    required this.title,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: size.height / 15,
          width: size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColorLight,
                backgroundImage:  AssetImage(imagePath),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}