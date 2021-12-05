import 'package:e_commerce_app/presentation/app_manager/asseet_maanger.dart';
import 'package:e_commerce_app/presentation/app_manager/color_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAsset.splashLogo),
        ),
      ),
    );
  }
}
