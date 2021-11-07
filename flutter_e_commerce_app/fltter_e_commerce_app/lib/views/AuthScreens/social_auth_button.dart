import 'package:fltter_e_commerce_app/views/MainScreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    required this.size,
    required this.title,
    required this.imagePath,
  });

  final Size size;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAll(() => MainScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.red),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(imagePath),
                height: 40,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
